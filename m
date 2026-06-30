Return-Path: <linux-gpio+bounces-39224-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4X4uHhvFQ2o8hQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39224-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:31:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF0E6E4E02
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:31:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oo+fNC5E;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39224-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39224-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C28EB309DC6B
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF3A421EFB;
	Tue, 30 Jun 2026 13:29:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A68408606
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:29:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826149; cv=none; b=ZZzxNb8yvw1UtJN50hcDbtWI8pmKiGEKEnLInkB93qm5Jrgrms45GNwo/X9maSE/i1b7FOoCPR0h9xnipXqu8xYbDVGb48mLjtOcJOLqV476lxqz6ktqf6BXMVclO+bQhVPthxapdJ8sz4fNzB9n6SIk6bI211aJc7MYdsxRFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826149; c=relaxed/simple;
	bh=iPY81BiouFI3RQXNggf0Cyf7QbFPROpsd/ICEhPhrkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdMPBi07/oMVZBm9m3Tx6qWJLgkcwcfLavbthQQ9TwyPSsZiXSkMWyayGlVelPXFyf7Kzwrad90qYc6Rt+wAu2r9gxKIcVlurOPm/2sYKgzVbPqwgck5+h6M6nKwT63UWaHVQGp5VbPgCuQZRxzcdJQkkNb2aIR3h6IJcZJH5pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oo+fNC5E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E801F00A3E
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826148;
	bh=iPY81BiouFI3RQXNggf0Cyf7QbFPROpsd/ICEhPhrkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oo+fNC5E32QAKEAbdWM7653YSm0IWRj4TDo68Pm6+g1MB1BlRCKZCd0Xeacj4PocG
	 /armcKXoQ2Y4g0qAiSlsf8LPoUxF2GpRdPn3cytIT07TS3crurKK/34JwILimow9KY
	 e8skzXuke3bIxkUEafe/xiy4SJCAi6+fWMgdx2v3vP0feUcZCVXtw8yYeGdHqE1GoX
	 ZS64yIVR6fBdTlQaGIzo197ZJjrq+s4kyzS/tyRKuK0a5ck2MOjlorE/6utqoXaqn7
	 rALxlKzS+4UrXv3YYoFUxgp8W+6phk/L6tJckJtg2Iqpp8F1awbTQdip8fBtZ76A4z
	 3aEhqqp9K1V8w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb36ed873so2289373e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 06:29:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpvAqJ9k5XA7TDxakhW/SEDXpFXfoC2i2N0HFBTsI9UYo5L3GA0cpuv0WjECWDHbDiEziQA07K283cW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy75i5KbnfJhVcXy7TkL/tJE2KUauk0O+wrxUdz1axlc4fr+cvN
	ydP43daYopTUlTwlcLv2pZeY3oL0Lh4Cv6FwOUzObZEXIodV6JOkZjXcodqYqd0uaTs43s1nv2p
	qe6MGqy9UyzX4srMO5TJXMQhxyL4OLGM=
X-Received: by 2002:a05:6512:34cf:b0:5ae:ba0a:9a43 with SMTP id
 2adb3069b0e04-5aebdba2f53mr611351e87.32.1782826146878; Tue, 30 Jun 2026
 06:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622164819.184674-1-biju.das.jz@bp.renesas.com> <20260622164819.184674-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260622164819.184674-2-biju.das.jz@bp.renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:28:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLnQ2ty7DtJLOt_FskG18ZsChttswhf=T_Vo4wLhq12_cQ@mail.gmail.com>
X-Gm-Features: AVVi8Cc7W16LdN0QZEghYk24bwn6OH-aIagj1IcPKeS-zMgm9Odg5eA-AQj3MqI
Message-ID: <CAD++jLnQ2ty7DtJLOt_FskG18ZsChttswhf=T_Vo4wLhq12_cQ@mail.gmail.com>
Subject: Re: [PATCH v18 1/4] pinctrl: renesas: rzg2l: Add SD channel POC
 support for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39224-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FF0E6E4E02

Hi Biju,

thanks for your patch!

On Mon, Jun 22, 2026 at 5:48=E2=80=AFPM Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add power-on control (POC) support for SD channels 1 and 2 on the RZ/G3L
> SoC (r9a08g046).
>
> Introduce PIN_CFG_IO_VMC_SD2 capability flag (bit 22) and SD_CH2_POC
> register offset (0x3024). Extend rzg2l_caps_to_pwr_reg() to return
> SD_CH2_POC when PIN_CFG_IO_VMC_SD2 is set.
>
> Replace RZG3L_MPXED_PIN_FUNCS() with RZG2L_MPXED_COMMON_PIN_FUNCS() for
> port PG and PH pins, dropping PIN_CFG_SOFT_PS which is inappropriate for
> SD pins, and annotate them with PIN_CFG_IO_VMC_SD1 and PIN_CFG_IO_VMC_SD2
> respectively.
>
> Annotate all RZ/G3L SD0 dedicated pins (CLK, CMD, RST#, DS, DAT0=E2=80=93=
DAT7)
> with PIN_CFG_IO_VMC_SD0 so that power-source register lookups work
> correctly for those pins.
>
> Add sd_ch2 field to rzg2l_register_offsets and rzg2l_pinctrl_reg_cache to
> save and restore the SD_CH2_POC register across suspend/resume cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Is this patch Geert can apply separately for pin control in the end?

Yours,
Linus Walleij

