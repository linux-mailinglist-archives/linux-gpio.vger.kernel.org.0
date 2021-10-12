Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBC442A21C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 12:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbhJLKbi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 06:31:38 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:45944 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235153AbhJLKbh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 06:31:37 -0400
X-UUID: 4408c824a8f947aaa53b05f088e8147e-20211012
X-UUID: 4408c824a8f947aaa53b05f088e8147e-20211012
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <sam.shih@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 869037599; Tue, 12 Oct 2021 18:29:30 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 18:29:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Oct 2021 18:29:28 +0800
Message-ID: <315d7823aa108c909a3d36464fe54763b76ab2f4.camel@mediatek.com>
Subject: Re: [v3,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986 series
From:   Sam Shih <sam.shih@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
        <enric.balletbo@collabora.com>, <fparent@baylibre.com>,
        <gregkh@linuxfoundation.org>, <herbert@gondor.apana.org.au>,
        <hsinyi@chromium.org>, <john@phrozen.org>,
        <linus.walleij@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux@roeck-us.net>, <mpm@selenic.com>, <mturquette@baylibre.com>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>, <sean.wang@kernel.org>,
        <seiya.wang@mediatek.com>, <wim@linux-watchdog.org>
Date:   Tue, 12 Oct 2021 18:29:28 +0800
In-Reply-To: <bc29d5bc-9ce7-6147-a708-e6304249b600@gmail.com>
References: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
         <20210924114046.26070-1-sam.shih@mediatek.com>
         <bc29d5bc-9ce7-6147-a708-e6304249b600@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi

On Fri, 2021-10-08 at 15:53 +0200, Matthias Brugger wrote:
> Hi Sam,
> 
> I'd advise to split this series in parts for:
> - basic device support via dts.
> - pinctrl driver + dts
> - clk driver + dts

Okay, I will split the patches that are still under review into the
above patch series.

But I have a dumb question, currently, we have some patches that have
been assigned version numbers.
If I want to seprate original patch series, and resend 3 new patch
series (basic / pinctrl / clock) according to your comment, if I want
to keep the preview change log, tags in the patch set: 

like:
---
v3: changed 'MT7986' to 'MT7986 series' in the commit message
v2: added an Acked-by tag
---

Which version number should I use for these new patch series ?

Does the version number in corver-letter and the version number in each
patch need to be the same in the entire patch series ?

// (Original patch series/thread, version number is v3)
[PATCH v3 0/3] Add basic SoC support for mediatek mt7986
  [PATCH v3 1/3] dt-bindings: arm64: dts: mediatek: Add mt7986 series
  // (the version number has been updated to v5 previously)
  // (basic part only, not include pinctrl and clock nodes)
  [PATCH v5 2/3] arm64: dts: mediatek: add mt7986a support
  [PATCH v5 3/3] arm64: dts: mediatek: add mt7986b support

// (New clock driver patch series)
[PATCH 0/3] Add clock driver support for mediatek mt7986
  [PATCH v3,1/3] dt-bindings: clock: mediatek: document clk bindings   
for mediatek mt7986 SoC
  // (the version number has been updated to v3 previously)
  [PATCH v3 2/3] clk: mediatek: add mt7986 clock IDs
  [PATCH v2 3/3] clk: mediatek: add mt7986 clock support

// (New pinctrl driver patch series)
[PATCH 0/4] Add pinctrl driver support for mediatek mt7986
  // (the version number has been updated to v6 previously)
  [PATCH v6 1/4] dt-bindings: pinctrl: update bindings for MT7986 SoC
  // (the version number has been updated to v2 previously)
  [PATCH v2 2/4] pinctrl: mediatek: add support for MT7986 SoC
  [PATCH 3/4] arm64: dts: mediatek: add mt7986a pinctrl support
  [PATCH 3/4] arm64: dts: mediatek: add mt7986b pinctrl support

> 
> I would also advise to not send new versions of patches as new
> threads and don't 
> respond in the same thread. At least for me that breaks my workflow
> as I use b4.

If I don't respond to the next patch set in the same thread, should I
create an entire new patch series ?

For example, if I want to update PATCH 2/3 in the bellows patch series,
and my PATCH 1/3 has been accepted by reviewer previously

[PATCH v2 0/3] Add basic SoC support for mediatek mt7986
  [PATCH v2 1/3] ...   (patch set v1, applied by matainer)
  [PATCH v2 2/3] ...   (patch set v2, need to be upgrade to v3)
  [PATCH v2 3/3] ...   (patch set v1, waiting for review)

Is this correct to send patch mail to maintaiers for the above
situation ?

[PATCH v3 0/2] Add basic SoC support for mediatek mt7986
  [PATCH v3 1/2] ...   (patch set v3)
  [PATCH v3 2/2] ...   (still patch set v1, waiting for review)


> 
> Regards,
> Matthias
> 
> 
> On 24/09/2021 13:40, Sam Shih wrote:
> > MT7986 series is Mediatek's new 4-core SoC, which is mainly for
> > wifi-router application. The difference between mt7986a and mt7986b
> > is that some pins do not exist on mt7986b.
> > 
> > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > 
> > ---
> > v3: changed 'MT7986' to 'MT7986 series' in the commit message
> > v2: added an Acked-by tag
> > ---
> >   Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > index 80a05f6fee85..a9a778269684 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -76,6 +76,14 @@ properties:
> >             - enum:
> >                 - mediatek,mt7629-rfb
> >             - const: mediatek,mt7629
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt7986a-rfb
> > +          - const: mediatek,mt7986a
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt7986b-rfb
> > +          - const: mediatek,mt7986b
> >         - items:
> >             - enum:
> >                 - mediatek,mt8127-moose
> > 

Thanks,
Sam

