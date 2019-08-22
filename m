Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8044988DF
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2019 03:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbfHVBM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 21:12:26 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:38751 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727558AbfHVBM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Aug 2019 21:12:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 300D021B10;
        Wed, 21 Aug 2019 21:12:25 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 21 Aug 2019 21:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=I/affUWjhNprrpXsHfcCHIXv2F7Ad9/
        xhK2EXQOpp98=; b=R8oRVyf4+2WowuRn9p7X9+NDdhJuTQccHkkHzttR0kr+DRJ
        sAr9eebs9yM8W45gAn5XxVxbG/nA32qf68iRA8+r3e7ME/ZL2CWvoqKObTHgQ5bu
        drVgG4GUdyd35LGdYAFHzdujOqQqQzb7D+2475nM54CrXwu1vs1ZBtrWYhwL9LCE
        pyz9+D0YCDlXbA5kl1oFu8+d7eGO8rt71Yw1FW7bq7Lrb54TDyMIrhC6ZQmt/Mto
        zB+KrKgqbhGFzgiWAM8+zNV97MfoopI35Mi5EM0PBOw94BW/awzx69H99K1+8Wce
        hGpfaGLtCag5jTZmAbd/C6JqzuTKWi3p/3gL7NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=I/affU
        WjhNprrpXsHfcCHIXv2F7Ad9/xhK2EXQOpp98=; b=z/MNqVn4EwaILd52FEMHrr
        RKIpAIcffgSeLx8MaYZSKtFf7FOJ+z/IjhtfCFlMoTMTEIapu8lJ1oEDR50Jyhn2
        PUJ0xqxV/AjdGOZfpz+rdghST/b2cX2zqx4rTwbDWlRmZTPZV/j00hlve+SDldzG
        NNxVj9gK13RX1d1gxsGK8JgbJqetp/X/UwXsuytc46pmlOLU2Z9EcBAgbsE2oqOk
        8RliXYSdAoeSdSfhc2VjZnw0MBk01BU8OL+k72w3guxp+rhCyhp9nOxIrwrVcoFL
        21NRdKvkENhpmzmC9vhkpwybwNFD3YtLG5aR+sEXQ4qFo2FezsIdYc2rIjn0pyVw
        ==
X-ME-Sender: <xms:-OtdXa7YYaTpVJZkqaJXJIMptTbysLndJ5nXJxSR0oyhGoY3KdOwfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeggedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:-OtdXW20vpqwb3uaN61RK5fb21-K4_ISy68rgttqjGofnKHW5Xn4qw>
    <xmx:-OtdXRoVkXCYsQ_VLMcew4DVvYt1JTnJKqw-v_CLPG3mT4REfg1d2g>
    <xmx:-OtdXV_8rOMGBeiEfxNf2zwHk6XTSSoLP9FyezgKUQTI4mXN6FK5OQ>
    <xmx:-etdXRbrydgUrhrJkdJ0SPThLT_ruOTuvcS8MxU0dNYF1qFAA8RaHw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6111FE00A3; Wed, 21 Aug 2019 21:12:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <a8fdfb41-73f5-462b-b38b-94bc1af9f64c@www.fastmail.com>
In-Reply-To: <CACRpkdakewyaF4Xp6=2c_h1_T1kY-1MQ3bbZzNv2uHSCndHQgg@mail.gmail.com>
References: <201908210839.fFMuc6Yx%lkp@intel.com>
 <15f11bd1-cde0-4345-8daf-234d61ebc9c0@www.fastmail.com>
 <CACRpkdakewyaF4Xp6=2c_h1_T1kY-1MQ3bbZzNv2uHSCndHQgg@mail.gmail.com>
Date:   Thu, 22 Aug 2019 10:42:40 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "kbuild test robot" <lkp@intel.com>,
        "Nathan Chancellor" <natechancellor@gmail.com>, kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[pinctrl:for-next_54/63]_drivers/pinctrl/aspeed/pinctrl-as?=
 =?UTF-8?Q?peed-g6.c:2325:9:_error:_initialization_from_incompatible_poi?=
 =?UTF-8?Q?nter_type?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 21 Aug 2019, at 21:06, Linus Walleij wrote:
> On Wed, Aug 21, 2019 at 3:09 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > This is resolved by back-merging the pinctrl-v5.3-2 into pinctrl/devel
> > or pinctrl/for-next as mentioned in the thread on Nathan's patch.
> 
> OK I merged v5.3-rc5 into my devel branch, that should cut it.

Yep, I just did a successful build of pinctrl/devel with multi_v5_defconfig and
CONFIG_COMPILE_TEST=y (the AST2600 arch support only just hit the lists),
looks good.

Thanks,

Andrew
