Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12CF4B015E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 00:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiBIXfP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Feb 2022 18:35:15 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiBIXfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Feb 2022 18:35:15 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 15:35:17 PST
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3DFE0536EE
        for <linux-gpio@vger.kernel.org>; Wed,  9 Feb 2022 15:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1644449718; x=1675985718;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wZrslbFYkv3CyGGamhytlpz6Yr8LDwi9Rm0AXijDQb4=;
  b=ER9yPn50wrI5P54nc6p1hreBb2EDU+jh+5g5yYHWqp3fT4J6OJy49FfE
   P3hdt2GtD4lZsPIDm9L9uIw2GpXCguw9oTLIljtvYqFEeo+RM0wCLH2NN
   LRhFCLE3FfRfGElz6SUdZa6NyDijC5UklOXcKz5KvK/cRfO+v+2Hywh63
   pVncDEMjilQGR4IrKsVqJzZi89Rj/SAXX3vsPK/nECiJzFbXtIZY+cCp9
   KrNAiTLo7iva6rnszWbi4l9sxqZyIQUkFFeg73j4jjvtz3bA/eukeb/o/
   cDrV3lbYvI1kWRo9b4Tn+RIao7QBZ9y5YyfgGCKUiYhAp+N+Xxb3y1AI1
   g==;
X-IronPort-AV: E=Sophos;i="5.88,357,1635177600"; 
   d="scan'208";a="193527944"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2022 07:34:16 +0800
IronPort-SDR: ZoXrVtCysiI7Z9VpQXfJEdXWE3rA87BVqxUrLkzY7sSbL8zwDHHpJYKP6DuebWNSAzxE0zea5z
 6PBQV/yiZo+BcbOfDTJbwibJCsyVN3doD0UOjS86Ub96+Jet2B6NzahnxcQSaIeS761K3k4FNt
 rRfEmcq4hxFUhbDqVCwlJ32zoJ5KRGzeThwz7imoRMyhF83LyiLBTWC+juslT6DZxq8WEvziTg
 g97+oaIHNVS4rgliAfQdrPrVoy1V88cN+JNfn0E5KSV5zAcPuVMTaAJ3oWtUzaXhMaHSv4PH5w
 FDYRP3G5wDkwvCdNl1JAvgPt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 15:06:03 -0800
IronPort-SDR: uczxCEQCWHeyiAf5R1Ru5fFctb5h9X2Db/en8IpY3+qiN0XLujZiIHW6qA+jxmu5Oh8ejib1Ee
 HAwudpuyEzpRDq6bOZxaqExKeCkyURadqcLJ/4pHMbJj4MMfaWGTCDRQ36xaGj/cNct2uYtXly
 ry19qumVrr3tNvEvU9r0TF8323Zoa6xENjAofNfj6FbAugsXxgYAntHzJqaIEVPbgifiLsyp/4
 F7N9UfhBuI+qfxcKIiWCDfAjzHsboq8UV27eb8+BZ28JAN3Yjoit9vZCCNBS7L4pP7v9e5Jima
 wrY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 15:34:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JvGRp6hhkz1SHwl
        for <linux-gpio@vger.kernel.org>; Wed,  9 Feb 2022 15:34:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1644449654; x=1647041655; bh=wZrslbFYkv3CyGGamhytlpz6Yr8LDwi9Rm0
        AXijDQb4=; b=rY4QPwrmYLoClTrUYzD8WuYDziIlCcL6Qzh5ga47J96D7bW4E/E
        uHo++jFo6pqRH0sTzoWjUfUUk/ow5pJHZOyWwMVXULqMuxcfICk8Yo89YSe7D+iB
        +ontFRWvUlgQq4THEU13EmoaCgwdmu1YHTMk1HyPnx/gKekkiBX9effBrmJ5YUCi
        c5uvREH2oErUrFBawLLvCuKimGJC4FbWfO/ZR4PPw97caXSoPU7UpKLGv+HYcd3a
        NJ1/hDNXM8+c5QlbbK/Es1DOzdVJi+hl5FLjwBxNZcpCEMynr/L/aecvCVN1+ICy
        PIBYtp9ikIPo/w8nmKt1QNXdRAwxBRI2ZPg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0XjRT68gsvje for <linux-gpio@vger.kernel.org>;
        Wed,  9 Feb 2022 15:34:14 -0800 (PST)
Received: from [10.225.163.67] (unknown [10.225.163.67])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JvGRn5J7Bz1Rwrw;
        Wed,  9 Feb 2022 15:34:13 -0800 (PST)
Message-ID: <fb3e9786-87e9-6346-cf84-2617adfa5b8d@opensource.wdc.com>
Date:   Thu, 10 Feb 2022 08:34:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] pinctrl: k210: Fix bias-pull-up
Content-Language: en-US
To:     Sean Anderson <seanga2@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <20220209182822.640905-1-seanga2@gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220209182822.640905-1-seanga2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/10/22 03:28, Sean Anderson wrote:
> Using bias-pull-up would actually cause the pin to have its pull-down
> enabled. Fix this.
> 
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> ---
> 
>  drivers/pinctrl/pinctrl-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index 49e32684dbb2..1ad61b32ec88 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -527,7 +527,7 @@ static int k210_pinconf_set_param(struct pinctrl_dev *pctldev,
>  	case PIN_CONFIG_BIAS_PULL_UP:
>  		if (!arg)
>  			return -EINVAL;
> -		val |= K210_PC_PD;
> +		val |= K210_PC_PU;
>  		break;
>  	case PIN_CONFIG_DRIVE_STRENGTH:
>  		arg *= 1000;

Ooops... My bad :)

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
