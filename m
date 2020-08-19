Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34B8249479
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 07:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgHSFd7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 01:33:59 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:55658 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgHSFd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 01:33:59 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 07J5XkPW029400; Wed, 19 Aug 2020 14:33:46 +0900
X-Iguazu-Qid: 34tKBCMUDE7r2YHZ1g
X-Iguazu-QSIG: v=2; s=0; t=1597815225; q=34tKBCMUDE7r2YHZ1g; m=sWk/+PIHvzNWuVDyEl2pixdTJdWUwHvAIRabQ8xYeRc=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1513) id 07J5Xjbu013089;
        Wed, 19 Aug 2020 14:33:45 +0900
Received: from enc01.localdomain ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 07J5XieP027576;
        Wed, 19 Aug 2020 14:33:44 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.localdomain  with ESMTP id 07J5XisN025506;
        Wed, 19 Aug 2020 14:33:44 +0900
Date:   Wed, 19 Aug 2020 14:33:43 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh@kernel.org>
Cc:     punit1.agrawal@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH 1/8] dt-bindings: pinctrl: Add bindings for Toshiba
 Visconti TMPV7700 SoC
X-TSB-HOP: ON
Message-ID: <20200819053343.GC1256849@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817014632.595898-2-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817194627.GA1432385@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817194627.GA1432385@bogus>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for your review.

On Mon, Aug 17, 2020 at 01:46:27PM -0600, Rob Herring wrote:
> On Mon, 17 Aug 2020 10:46:25 +0900, Nobuhiro Iwamatsu wrote:
> > Add pinctrl bindings for Toshiba Visconti TMPV7700 SoC series.
> > 
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > ---
> >  .../pinctrl/toshiba,visconti-pinctrl.yaml     | 82 +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.example.dt.yaml: example-0: pmux@24190000:reg:0: [0, 605618176, 0, 65536] is too long
> 
> 
> See https://patchwork.ozlabs.org/patch/1345570
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Thanks, I will fix this.

Best regards,
  Nobuhiro
