Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A76D6C05AF
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Mar 2023 22:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjCSVhR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Mar 2023 17:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjCSVhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Mar 2023 17:37:15 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D5212F2B
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 14:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679261805; x=1710797805;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8VYkA5Dx+U=;
  b=M1xlSY/ukRx4iFoFcLhfcWhoHLSPPuIgI/IFoFJcl8SWrQaIQcHgVxoZ
   WUodbT0NVH21cqROwFvjXhpnvhhh++hgVwf+PT0ZAXcJGaJ3sHJwvJ2Gq
   OLqU0o9vUE8B8Errm4hu+10+zX2p+XdSNdMEgd5TrJ3//yQD57sfVoQmq
   vgypzIeBiKlPFbFrfnhx1Y/hwxVMwNHP9TwqDkZW8nSA4qNf3kNW/1LyN
   a6yWHbI9N8AKYHYKBJ9qqyy3W6J3KbMJY0XiNV7Q7T/2i1TSwi0W3WRCu
   5Vp06RMifVATt8H5iifwfnjRXwEjfiImKv7n0m80UN4EByBm3YLA3BpUS
   g==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673884800"; 
   d="scan'208";a="338033422"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2023 05:36:10 +0800
IronPort-SDR: uhVTL/bzaEbzp84TtO/8XBTpevAt9nEoKVAMg+33kMhO8akXQ5VOHI2OSGpkPnDhb4dOHY1lpQ
 z/ke5KRoW3kH/QrvirCaJp+0QS+JAGI2CIxwiT93fnPD88Gb7hpBXWjwcVDyrps30RsQslvVau
 gBXh1ZM/QtP4pcmQahRXk0tCenq0r0WD+mWOUvmHLUWWtOyQvl84v4Gww201DX+WhW1RQ9rrGB
 grfrhSXLUO+HjZblz7TWB0V3VeMHGjJsW6+ejYfCYzdeT+ja5JBdaMsSpgdT+Ffq8Cu69D/wM7
 7Yw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 13:52:30 -0700
IronPort-SDR: ZycCJGuKepCpLVksPtNEImsbmYxUJJ/BxMyFluwrARrv0zICY4w5C0hlp4c9LWvaWm0Aasqe9r
 /KE1XRCHEmjJpdLsz0A+HmH6JowQE4W+L7bo0U94vudDlxXQe0piX/CkT1TdVtu/iV7VrfTTOQ
 Ikp0TWmpeYV2l8I9f/YhXNbTLnLIjPMXfknXXaMfsPF8Ls6GEvsRlDZ2cjZ7+QGzd1a8xbfDlO
 7pPUgxsRWohg5Kwb/aTXeZvkTxk5Jgga/mSVFCvd8NOrHU/P79hoYaZ1xe3HcPz8ECFd98PSXb
 sdU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 14:36:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PfrlY24rTz1RtW1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 14:36:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:content-language:references:to
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1679261768; x=1681853769; bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8V
        YkA5Dx+U=; b=S8JspY/jT9HKo9uIoAqdicok3stSmSP3ZC72QphNU7sDF1HRlu5
        WEHlENHnykDAc+PypzLR3AKh+nkdMH083OdE11omsr4lq8r6bvML7GaKsZVKacZc
        MZHz5SQ+ppoKtSaDEwpYgqjDYxa5D+COba0qcQKw+mvAjO/hVOxH2r0a2BiHgjcj
        TDQPTShi6TS6CRaKSdirsSF0+p+Y3zl7lZDKJ7b2fss43cDQVdW/HXyTxJeQfXZ8
        wT8a1dOL4COVNs9eTAD+fnEHjbLliqP/dQCY4TrpRaEg8oDyHXx5471RrqK7Xg4z
        0nN4CP2SYOKmSfVIRogCAC7RqfZYz9N1OXg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id I_mJrDvuVndq for <linux-gpio@vger.kernel.org>;
        Sun, 19 Mar 2023 14:36:08 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PfrlK1xCLz1RtVm;
        Sun, 19 Mar 2023 14:35:57 -0700 (PDT)
Message-ID: <de10b014-1a97-e74a-c7c4-b1004bf4cb60@opensource.wdc.com>
Date:   Mon, 20 Mar 2023 06:35:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>,
        Wells Lu <wellslutw@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, patches@opensource.cirrus.com,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230317233623.3968172-1-robh@kernel.org>
Content-Language: en-US
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/18/23 08:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

