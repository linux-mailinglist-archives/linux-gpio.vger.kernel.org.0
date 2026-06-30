Return-Path: <linux-gpio+bounces-39227-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H1f2CuPHQ2quhgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39227-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:42:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA926E4F7A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:42:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CWrBDadN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39227-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39227-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC227300E700
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E283403F1;
	Tue, 30 Jun 2026 13:38:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21517334C2E
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:38:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826721; cv=none; b=CeKp1JfBoWehLSIwvE5/kKiWYsj67X/uHX5xrY0BtsCWp3CLgylKP44WVaB9RrcGz0uMoDxv/mY61dPhm0ZLrD/FCMIehm1JDFKI5GHcuxNWW/3aEuqrjfSKykg0RcvCNzt8R8VkaZ0YqAG/wJianVsDwzcVgkUszu41drC7cKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826721; c=relaxed/simple;
	bh=1ENrcvJDdsIm66iYGyaOW5Pbjt+5t86pom1UGSXvLPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mskmaz9sczyxbwesNsNDXMCl82Qvz3mvsx+eww9OCZ3F4YgRieBDsZOsWeauhpnuX3yo9IFt/wodyO960snsq8nVNmMdM7Y2rOq/MV1aH5ZRvKXixoSZSiwXfN3/Zyw0nDnljo+KK47+WwJ1lYocWsBvGLSBgqukKgHhv2ykfXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWrBDadN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD86F1F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826719;
	bh=1ENrcvJDdsIm66iYGyaOW5Pbjt+5t86pom1UGSXvLPc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CWrBDadNRqlfYH3ac7TgRxw71NLdUhmWcgAzGvdIx/GmOam6OEOihk3KYlE0fCQDY
	 NkpC8MrWoyLpemDGFJiZ2kPNiEL0NY+DbURbHxW5NtWnYHURvBKBLlWVWHRgh/3M2k
	 XOIx1wm4ngJd31TmrM1wI8WObxyvETAuQzb6ER7toEJoJQ43PrO0VNMe8b1WyxQHiL
	 Cr6xgvyNpq7MT+quo3iK/iPXaTP4tI6Ftx+nqC8uBpISpVL2V70tb/3eGHxUefh24c
	 /8C5WhYJ6FKMt5UVh98TpPVu8stSXITqOmOrvTsndmtgjZXuw1bhDOI1+BT/nyxpee
	 BVsz8qNaw36xg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aec139da7eso216312e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 06:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqP0vFayfDHkse9ITXBGEhXPEEZ9qTUddUeTI4h+l1nKaJdlKW+atDCdM6PjvZRvrrdVuEZ5Sbl937o@vger.kernel.org
X-Gm-Message-State: AOJu0YxsAdJX4tR/XOJV/2K5xsa1iSprlLxw7NXLemj0fNkai/rnxBAV
	VCOM3v/DOnw9K4vqToOg3/wq/n5mTfa/MRmfF4czjRJ6Wy3ucJ+kBI05gfDSlf2frK6p1Wvke8j
	NO8QDG4N6VxACNDb5g5Plf3ARvCc6zoM=
X-Received: by 2002:a05:6512:2396:b0:5ae:a9ed:161d with SMTP id
 2adb3069b0e04-5aebf983f62mr652982e87.27.1782826718752; Tue, 30 Jun 2026
 06:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com> <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:38:26 +0100
X-Gmail-Original-Message-ID: <CAD++jLm3FHxpG=8b3Fa5jfM0QYkXDSDM8GNEOkujnca=N221vQ@mail.gmail.com>
X-Gm-Features: AVVi8CckcmyOy8Q8WKy1X1cYcgkGZjxP6kOyh5TJJvbuA6c6gkWaVZm2f_bxRhA
Message-ID: <CAD++jLm3FHxpG=8b3Fa5jfM0QYkXDSDM8GNEOkujnca=N221vQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Drop unused irq_data argument from msm_gpio_update_dual_edge_pos()
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39227-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEA926E4F7A

On Tue, Jun 23, 2026 at 1:27=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:

> The "struct irq_data *d" argument to msm_gpio_update_dual_edge_pos() is
> unused, drop it.
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Bartosz will apply this patch!

Yours,
Linus Walleij

