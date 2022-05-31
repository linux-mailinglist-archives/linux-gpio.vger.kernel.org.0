Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86C65538D9A
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 11:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235515AbiEaJXI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 05:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbiEaJXH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 05:23:07 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596502613C
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653988986; x=1685524986;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=RwZHPwLQi0zkefuKPqdJYX4ZgiLMBfNkovTNMntcpxM=;
  b=dmlOG0//veUjz005z7IXFI0VgoOen53KvmzXVb0cKd1SSkutmkJMqL1m
   GZy9XR7zrhRyXD9ZxxNnfqs9WemOW5EOi9uq3WlauSQY/u3WY/Wc0kHDZ
   iddGgjKujNw643K4UU4W4FNpqxpVTSf7G/ruzGeDAqfNRZBqnPcEb130X
   aJQ4utEV2yOlpm1Wdr9ShPuE5FlDuqUkCNpgd14V4g19CGo84bFUMJtrB
   nGsn+9yrXcpU91jGGmeYFg6g2bIWJAMAUj3qEzxiHTTuVFBbMe7m59Kle
   Ux+Ukcn2sqLrR8L268fGuLn6vZLSba3VcedTf8bKy38BXDDlFjBJbjNIx
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="361574201"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="361574201"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:22:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="605578188"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.169.215]) ([10.249.169.215])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:22:48 -0700
Subject: Re: [kbuild-all] Re: [PATCH] gpio: sifive: Make the irqchip immutable
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>, kbuild-all@lists.01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
 <202205201122.xuM6bWUt-lkp@intel.com>
 <CAMuHMdX_WMwPVTbGQYLSeCb5P2BNimkzeif+o9oDwx40qt7D5g@mail.gmail.com>
From:   "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <1fee01b7-79b7-5a51-4852-c87a48dc2433@intel.com>
Date:   Tue, 31 May 2022 17:22:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX_WMwPVTbGQYLSeCb5P2BNimkzeif+o9oDwx40qt7D5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 5/20/2022 2:46 PM, Geert Uytterhoeven wrote:
> Hi Kernel Test Robot,
> 
> On Fri, May 20, 2022 at 5:29 AM kernel test robot <lkp@intel.com> wrote:
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on linus/master]
>> [also build test ERROR on linusw-gpio/for-next v5.18-rc7]
> 
> As of commit 2d3535ed2c73fee3 ("MAINTAINERS: update the GPIO git tree
> entry"), the GPIO for-next tree has changed to
> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git#gpio/for-next

Hi Geert,

Thanks for the information, we have updated it.

Best Regards,
Rong Chen

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
