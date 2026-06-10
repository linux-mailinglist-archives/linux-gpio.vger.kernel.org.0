Return-Path: <linux-gpio+bounces-38297-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9+BkNRPYKWr7eAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38297-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:33:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 676AE66D199
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 23:33:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JVMUYyyF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38297-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38297-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38CB7326719F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 21:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00AA39A808;
	Wed, 10 Jun 2026 21:30:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB6331ECD
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:30:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781127042; cv=none; b=KwyT/6Zf9gLyLgcnOPgR1nAYBfuqmMOVB7p0Y0Oz0WbYw4VsYIY6hRTIJodYY46SSn3hLjKc+WjkzjkTVIdpLDQbarZ2fX2K95+YWdtFmSxLIH78RJYtIodQX0FRyvEgQIEL0Xp5xv43JV33cJ1DonO2GM8IwqFkfh3Npnkj1Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781127042; c=relaxed/simple;
	bh=7WQCXjEo/laIMBkgD1CYNteLnFlzYiX2sAAQcUzXUX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0WzAMbg5iAaOFRtLCYy97aqMTALeUKhMYdl9lsGzOg7Z6MuQicPHGYwkwPb/B2XyFUNpRqy0XvyK05F7rRf/t39GYy0Ru9VPMuRCfkOkzFpIsTnzXVf/S2cTxh6rrSWZPKmeuvrpO7genje2vO1x7csYexG57b+7U3GcWfqcWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVMUYyyF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FAC1F0089B
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781127041;
	bh=7WQCXjEo/laIMBkgD1CYNteLnFlzYiX2sAAQcUzXUX8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JVMUYyyFjGJ4PUbq+KXmbiaIh992fkoOvSDkiM9HAJ1AKF4wCE59CWqIx1UvY4HFR
	 aVJjuahjFO9bTVZkGnAv3JS4n2SWHBoxcgfTevTMSGGcPkY/HHusB3dQlPGK9UTKG/
	 82YugnUqrBjF9PKXcyHu+mDII9OyPQqx78Yp9OQyC55rIi+rOWczBDAupukTC+DqSv
	 SS7sERrsGQVw+kExR4C+eARHzQZmYVa6vZenz+0SPsqF1sSG3tIZUsXMMlA2kqWgNn
	 YMT6ZiHY9qr/QBfvKQDKDCDtqK01aeWJ9E5BgWEEXXQpH16qwmQUDAvG2deb61jHhl
	 Nbp0wiLqv12pA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68dbb38aso7036879e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 14:30:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9JLZK+BaLDclLlv0c26qX4+iXMk+r9ftC18gBtpCYPS8I5SRwwtn6Tj7X1dsB0Q0f0N0CBdmxj7Km7@vger.kernel.org
X-Gm-Message-State: AOJu0YyY7JGbLu779u8VcS+njWXuqT3F576kaYqX0Cs5fD+NVgbR4cEy
	poWDPyuQUytCGQxm5EUXc52EdPHsXs2QKliCmyrcll+abx8glqa0+eJIauMX9/Xdr/LQAuAXHom
	m67MvYCTOgt6z4wb1D2PNDxar4HoPzs4=
X-Received: by 2002:a05:6512:2346:b0:5aa:6f47:32a0 with SMTP id
 2adb3069b0e04-5ad27ab1b9dmr10041e87.11.1781127040221; Wed, 10 Jun 2026
 14:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-eliza-pinctrl-fix-sdc2-gpios-v1-1-cce631b7e7dd@oss.qualcomm.com>
In-Reply-To: <20260609-eliza-pinctrl-fix-sdc2-gpios-v1-1-cce631b7e7dd@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 23:30:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLmN6RSFD_R_ee8Yt_EmadGze4--PjnaeisqFSt_UejJ3g@mail.gmail.com>
X-Gm-Features: AVVi8CdRxDNEX30dLaT-ERVk-eUzzOe60cmP1q-6ymwD9PXZ1if8KYbYZw6IGgc
Message-ID: <CAD++jLmN6RSFD_R_ee8Yt_EmadGze4--PjnaeisqFSt_UejJ3g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: eliza: Add missing sdc2 pin function mappings
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38297-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 676AE66D199

On Tue, Jun 9, 2026 at 2:03=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.co=
m> wrote:

> GPIOs 38, 39, 48 and 49 support the SDC2 DATA function, while
> GPIO 51 supports SDC2 CMD and GPIO 62 supports SDC2 CLK.
>
> However, the sdc2 pin function is not listed in the corresponding
> pingroup definitions, preventing these pins from being muxed for
> SDC2 operation.
>
> Add the missing sdc2 function mappings.
>
> Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Patch applied with some fuzz, check the result!

Yours,
Linus Walleij

