Return-Path: <linux-gpio+bounces-34186-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPzqM6HHxGmY3gQAu9opvQ
	(envelope-from <linux-gpio+bounces-34186-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 06:44:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4E432F793
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 06:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D93993028828
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 05:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47F03A451D;
	Thu, 26 Mar 2026 05:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j9VIybWW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D2B39DBFE
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 05:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774503805; cv=none; b=ujt03+68VACy7QO+xwul6s3qbvn+HLrbD/nk8b0CPnifb6T6bisLn15qoJ8LnFjv1IINUQnu31b2hQzK3/YloBamd6Hu6WIvqnI/lu5bQNH8ZwrexvVgRmdzzLT/G9lASCKD0opN6svbWiuRXRVCL1fg7uXOngYeanJrr2Emunk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774503805; c=relaxed/simple;
	bh=s27fcGErMBzKxY6t96v5alAOcgMfI4+l2mcmFG7QKYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DO8lx2f5JNxUsYwMnFTZFGOIRZLv5xQY+Ucilz4Yvm1ffxO/JB/vSQSpuhlTrL9Ce1ZWZH38jyVnu+D5r7ftBuB+59aV04+H7tq8BztVykFuzWiV+egFuP1XIhqbR9P1K3kA1nhwjupIhwX+gq02/H/1hXTvfc0BAQ+9/F2rLI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j9VIybWW; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-829781b2b01so360913b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2026 22:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774503804; x=1775108604; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=;
        b=j9VIybWWMartLF4E6u3VULN362czlBOTKyMl0iyYmmoAGbIhvg3XMOa6JDr0RwEPfv
         0s8bBNttKoQKhSHOwxycdbFzFsjM8f4Qcx+/rh0wlb2A2z2EFLB7wyAFHpMid1CKZCF3
         ODrhVtSkmB2Jc+j7xaCNZFM9E3NOxLvsHVvls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503804; x=1775108604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=;
        b=gO6ZnieYO7iPQF7UC8upwzqzVgICqT+pXOUVWh7QZnyDZj1/gOsHQOmhiBmzmcEKRn
         3Ewg8tE3r3IKpJFEZjE/cstJ3Ozts4Ucvprwr7mRKaxMmsF2O8MpQb39gs8lO9ZzooMy
         wALNn46XFlNHpNGHFA9cJPNxk1ayZ1t5T7iN8knUsE2a8HRMm1K1xyZgUszylXAP96Oe
         GH3qFsJiv+m11G0vHWRGO321WB5bOA8sKQDHg+2vxjR3Rf5fE/6HneFLU3IsYQ6mwsid
         LzT/AIhp2rQIpDeB8jQG1X7ntRcVXuQbFlLZhOyav/1SfcRNvMVqGNdQsytvPD9ndpuH
         YYLA==
X-Forwarded-Encrypted: i=1; AJvYcCXGawBOSmU5aar41hh+Su1FL0AUZ6QvjFqPSBC2kEubucZLGvbbe1FHKGq5rWzj/+5ZTmHMKcUmdzEY@vger.kernel.org
X-Gm-Message-State: AOJu0YzygYuaohQutw/P1+yGEQuh7Rt6nkhypdyRuYBPD0uRSvzbEn2M
	dDjiAuYphYVe68VAXLKedcV5o6VgytipSU1wlV4irazotDQhz5muMFsGtCoITSD1RvHUf18SXpx
	zQkY=
X-Gm-Gg: ATEYQzzgxajAPujgubDS8E8jriXQp1yuWJAaoh7dFRnyHGYTurW5j+0Oa+ym3H+8Q10
	PXJ0MqhvVgbU3m8GnBBLedxepl2xtlp4rVgDIPC77mLcTJL/F/GgKv1JVyO+LYMQm3aXogXJ1+5
	a1p6aZMaMSMsoNATmNkvo8lcxq040tDE1abXHiRmeGMDj3OnZE3vL2lOvLl41FfmfgFqH07UEgR
	vEmClYiRMqaj3QtYOYIwz+RBIczu6Y/0lG0Mjp10awuTdEnIugFqSr1aHAgjSV5KE7umkkFBNwK
	XUCnuMZhxYwE6YaqKayUjlJHjHERIYKeDvrgccxFYI+r1qP6XfTeYp2r1e1/5HyyDLCqLErU6hH
	C9aRA3PRNbQfmyGuHts01auWxCQohk1eQNMGlWaNtFn1hC5WVt9pS4AfeJbOGV6wpeUtoK/x9B6
	b/b1wnwmggZ+Ptbs18FwHWhgkiD0+2w/K7uDYpR/K1/08+XmiH020E398=
X-Received: by 2002:a05:6a00:1ac7:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82c6dfb1e09mr6141757b3a.30.1774503803653;
        Wed, 25 Mar 2026 22:43:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d5d89b5sm1411849b3a.41.2026.03.25.22.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 22:43:23 -0700 (PDT)
Date: Thu, 26 Mar 2026 13:43:16 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wens@kernel.org, Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
Message-ID: <20260326054316.GB910813@google.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-10-l.scorcia@gmail.com>
 <c1a425ba-a4ca-49ea-9660-5de74bede124@collabora.com>
 <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
 <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34186-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.infradead.org,packett.cool,mediatek.com,collabora.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B4E432F793
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 06:22:42PM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/03/26 14:54, Chen-Yu Tsai ha scritto:
> > On Wed, Mar 18, 2026 at 8:39 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> > > > From: Val Packett <val@packett.cool>
> > > > 
> > > > Add the dts to be included by all boards using the MT6392 PMIC.
> > > > 
> > > > Signed-off-by: Val Packett <val@packett.cool>
> > > > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > > > ---
> > > >    arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 +++++++++++++++++++++++
> > > >    1 file changed, 141 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > new file mode 100644
> > > > index 000000000000..fbf6f671524c
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > @@ -0,0 +1,141 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (c) 2019 MediaTek Inc.
> > > > + * Copyright (c) 2024 Val Packett <val@packett.cool>
> > > > + */
> > > > +
> > > > +#include <dt-bindings/input/input.h>
> > > > +
> > > > +&pwrap {
> > > > +     pmic: pmic {
> > > > +             compatible = "mediatek,mt6392", "mediatek,mt6323";
> > > > +             interrupt-controller;
> > > > +             #interrupt-cells = <2>;
> > > > +
> > > > +             keys {
> > > > +                     compatible = "mediatek,mt6392-keys";
> > > > +
> > > > +                     key-power {
> > > > +                             linux,keycodes = <KEY_POWER>;
> > > > +                             wakeup-source;
> > > > +                     };
> > > > +
> > > > +                     key-home {
> > > > +                             linux,keycodes = <KEY_HOME>;
> > > > +                             wakeup-source;
> > > > +                     };
> > > > +             };
> > > > +
> > > > +             pio6392: pinctrl {
> > > > +                     compatible = "mediatek,mt6392-pinctrl";
> > > > +
> > > > +                     gpio-controller;
> > > > +                     #gpio-cells = <2>;
> > > > +             };
> > > > +
> > > > +             rtc {
> > > > +                     compatible = "mediatek,mt6392-rtc",
> > > > +                             "mediatek,mt6323-rtc";
> > > > +             };
> > > > +
> > > > +             regulators {
> > > > +                     compatible = "mediatek,mt6392-regulator";
> > > > +
> > > > +                     mt6392_vproc_reg: buck_vproc {
> > > 
> > > s/buck//g
> > > 
> > > Also, no min/max voltages?!
> > 
> > We really shouldn't set min/max voltages in the PMIC dtsi file.
> > 
> > The min/max voltages are supposed to be the intersection of the
> > consumers acceptable operating ranges. The min/max of the regulator
> > itself is already implied by the model / compatible.
> > 
> 
> Your point is fair, but it's also true that some of the regulators are not
> really meant to ever output anything different than what they are supposed
> to, though, with slight variations being possible... I guess the best option
> here is to leave declaring voltages to board DTs instead, which is sensible
> in the end.
> 
> Okay, agreed. Let's go with no voltages.
> 
> Reminder for myself: there's a bunch of PMIC devicetrees to cleanup in here...

And to be honest, even the default names are not needed. They are again
implied by the compatible, and even the regulator's own node name.

So either we could have a whole bunch of empty regulator nodes with
labels for easy reference, or just have the upper level "regulators"
wrapper node with a "mt63??_regulators" label for board dts files
to reference and add the _used_ regulators to.

If you agree, I can do the cleanup work.

ChenYu

