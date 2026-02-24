Return-Path: <linux-gpio+bounces-32112-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMPSEC9onWlgPQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32112-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:58:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B36DE1841D2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C47D830C5FFB
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 08:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC15369222;
	Tue, 24 Feb 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLvgV3h8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1E136920B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923313; cv=none; b=MdkMzSLZ+vduC+el6XtC6p7UGaUVsTANyUWdztNI7y+97UWxxZZhR2RB34aHq/dcCotcggvHC0VxTCZ3FFqZygiFfNnoYo3IPpvtEK9Wg1glUuPRD33DRnzw4aJnCsLFYSYVgFyKfpbvhcesdansJg2DzSHL0Wz0EatiR/Zlhns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923313; c=relaxed/simple;
	bh=eBGJSU9j2XvRNYPGQ924MHUta0p+ElB874PInZEXerc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjCYsvW9YnxPM8FbtrHSnoB2kPhy/KSQA2kDeaTND65G59nICef7wefL8cIrxXuBUe+a8SVS0ds3G6Pppddx+S8Ofllv2lwrMR0JlRagoUiOlWRGiBwlblOglggsz4M0xtm0a/gWcsySWiG4z23d8IGOu5V/obW14pTLkH/K7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLvgV3h8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1101AC2BCB3
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923313;
	bh=eBGJSU9j2XvRNYPGQ924MHUta0p+ElB874PInZEXerc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lLvgV3h8xq5qg9NSOkvmF7CjP3FUDzajWTR3ZL4qVzb0hUn6Wk0+NU7F424T2W4jn
	 j5MdGSfqvgf0LT3TwMi35VzR+R8f/+Z+yJy4UdftmtitWglrcd+x+92cIBkGBbSYHv
	 EubQwcnYYbJyYEAYj7+toLjm1NS1sVmQXQLLLruviAmpsLOzNWLMrYd0TrPAZLDkuk
	 t+y2oXUPxov0MTBjHsQBuA7MSShduO99Lm7r8MD1hk9k+UZUkvUG0Z6mwI3hwbcHOd
	 +BWiQXrSv3SRztdzO8Mud9kd8OsdxpAJhug2CAqWWiltc/alfl/X6B4RxlGARZfuIj
	 RF1bZz8THCBww==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79427f739b0so48110037b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:55:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqV/6f/KgvewWTFV2VFRyuUb9FMvVYVp5VwTH1CdMypL+fYut6Yojbg1EZDdCXeDqfD8uJnQ/AaJnG@vger.kernel.org
X-Gm-Message-State: AOJu0YwEFDkukDQdw+vSfIt/JM4xL/6v0Ud6fP6jwOhrxyE/EO/6rCIt
	7QgOh8AUSWMjDs4qn18iQy92ihf8TzIK0vNlNd6118NwcIMjCs0SNuJtaZ0ONoulBOD53yPsjEB
	uVOFA5/47+gopGeEYfpBOHEtou3EbcMs=
X-Received: by 2002:a05:690c:9d:b0:796:3981:fd6e with SMTP id
 00721157ae682-79828cd06bbmr109887937b3.10.1771923312312; Tue, 24 Feb 2026
 00:55:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-eliza-pinctrl-v3-0-a7b086595651@oss.qualcomm.com>
In-Reply-To: <20260216-eliza-pinctrl-v3-0-a7b086595651@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:55:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLn+SDeQ2tMFGLP_Ycnxe=o1LVwiL17Ke74gQhnMkzcnnQ@mail.gmail.com>
X-Gm-Features: AaiRm51aLfBZxP6XvJrlAlD60TOOnbxW6lKE4rEhjZm3pzzukzTnwAxQzLo48F4
Message-ID: <CAD++jLn+SDeQ2tMFGLP_Ycnxe=o1LVwiL17Ke74gQhnMkzcnnQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Add support for Qualcomm Eliza SoC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32112-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B36DE1841D2
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 2:44=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:

> Add the pinctrl driver, document the bindings and enable the
> driver in defconfig as built-in.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks Abel, this v3 version applied for Linux v7.1!

Yours,
Linus Walleij

