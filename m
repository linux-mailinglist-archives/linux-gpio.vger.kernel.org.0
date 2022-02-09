Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0094B0160
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 00:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiBIXdo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Feb 2022 18:33:44 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbiBIXdm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Feb 2022 18:33:42 -0500
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594FDE051156
        for <linux-gpio@vger.kernel.org>; Wed,  9 Feb 2022 15:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1644449613; x=1675985613;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SCi2xcOs63Mel3nuQiDXDDze0xfHJgyKIw0uLAqxVp4=;
  b=lMj80OY2vIK82QrunB/XUK+21/35ko3VIPIzK5uN+q3CX+kMUOwqiHIb
   bT1f+P/6HKU3YgOKExLCQtowhBzqxSVuS3bVpB6Ve97MVsSBcPMSRpGLL
   TePtGz+JitQbR+zHJNZuZMNrJQPXmjUAHsMto6OGAOFUj7tOIvSNoDyly
   kChrZiZfsPBHuMxFa/z1ErT25SXGmArxJNGKcFg+KsNOf/Rh4VZaD8qRq
   tZIqxLAK+oUsTGfrUmjnvAIvM06FbGch+rX/ClyXa0e0FEbWgjlfZHpkw
   o6lQurf45gVCxuIm/zzNi8GM0sM6Q3hOO0cDTaI7XXJaeKb2e50lBYtnW
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,357,1635177600"; 
   d="scan'208";a="304450437"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2022 07:32:14 +0800
IronPort-SDR: +3iNPhN+hT3MZbv096nx5N0SQDkhzdhFi89UYOd/NVsuZ8EVkok4UgSiYnoDJL2ju+wCG+CyKe
 G+i7ZwOoWAs4i2XkhHd0bD0h6UXxloBABF8okM9HSmabF4vslsP2BL2q+Gm2BUkSqVyFaTsONV
 85dXD3Ap+3SuvfY6CBhkL0lVxdBEwRa5y8nM7Uf88RAVuJn4rjEq/Jp/d9kzDKWx74S7ltv4bH
 FVpBY7BLEJMx4e+K/hAjM3WK7iDrhshjOwGdbUDfZku/BcaXlo1eWSMHrvoK5qCvkuQHa7KTaV
 GCVzefNfDwpsbroj1/6ICXK/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 15:05:12 -0800
IronPort-SDR: x61YC0ZG5HSKX/m7ObcTahqsWxxpzXyvA3b19eilPd1oRYunvf2GGs8M03gXDJYWIS9jo3oIts
 DsDBioXVFOJCJMXahSAJLmJSBm/gWit8IHEddrjWBgJ4m9QZWZiu4iwy6MXqNLmBCjEW2kTsey
 JsNiwFmPu3eZ3DkcZIJgnSk+XZEbT8A+Qy6PvPZU1+uOHsYAO++Y3A4uwIA3dMyWZRl072CLYm
 lKgg0vwtVv4RxOYDkSfeMnSzJBrSx0mdSZPD+4u+GhFa4mZ2PiBabYOYqxHuqeEP1QQQOW5NvW
 PbY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 15:32:14 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JvGPV06l0z1SVp0
        for <linux-gpio@vger.kernel.org>; Wed,  9 Feb 2022 15:32:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1644449533; x=1647041534; bh=SCi2xcOs63Mel3nuQiDXDDze0xfHJgyKIw0
        uLAqxVp4=; b=ZRVIrmYj3XrTAJf0bnCsH4qtvNW0lUuFx/jJpWP8hLrqcOQmCjH
        CS3UrT8uPJ31QdHyUUwNLCHm7OOsAj1e34aBO71VmFXG2NcDvCBhyhFSyiG4fr/U
        L2FFphXB3QBK+lw2V84dy18E+QBE3SP2Yx2dO9XcD1KO4LztCZmKEEQItl6U8g/H
        WVkkyb/6lPH3M4mOB1fqrMeaKI5WtnpucaK4rARJudXqICvOtws0Z41hzi4zQHS8
        phkVH8bXie4WlQPTWBMTcJ31yPyIxksSNokHNWC98vJi1YLHjlRqrV8U1YvP+e9J
        btSV5NXYRLTD1QYQVM7bpYz1TYQkTYU6JGA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id nRqe74LgLjoo for <linux-gpio@vger.kernel.org>;
        Wed,  9 Feb 2022 15:32:13 -0800 (PST)
Received: from [10.225.163.67] (unknown [10.225.163.67])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JvGPS2bf7z1Rwrw;
        Wed,  9 Feb 2022 15:32:12 -0800 (PST)
Message-ID: <2b574c51-5039-5145-b1b2-a139c27daa96@opensource.wdc.com>
Date:   Thu, 10 Feb 2022 08:32:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] pinctrl: fix loop in k210_pinconf_get_drive()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sean Anderson <seanga2@gmail.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220209180804.GA18385@kili>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220209180804.GA18385@kili>
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

On 2/10/22 03:08, Dan Carpenter wrote:
> The loop exited too early so the k210_pinconf_drive_strength[0] array
> element was never used.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/pinctrl/pinctrl-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index 49e32684dbb2..e3d03f2de7ef 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -482,7 +482,7 @@ static int k210_pinconf_get_drive(unsigned int max_strength_ua)
>  {
>  	int i;
>  
> -	for (i = K210_PC_DRIVE_MAX; i; i--) {
> +	for (i = K210_PC_DRIVE_MAX; i >= 0; i--) {
>  		if (k210_pinconf_drive_strength[i] <= max_strength_ua)
>  			return i;
>  	}

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
