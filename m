Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 403E918FCB9
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 19:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgCWSe1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 14:34:27 -0400
Received: from mga09.intel.com ([134.134.136.24]:30763 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbgCWSe1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Mar 2020 14:34:27 -0400
IronPort-SDR: anCU9mDSm8x9mp6F0SlD0a1KMRPJwEvzBAZjPVUQidojPIIAi28FYFtlOb4Zw1feHbmPlmFs3U
 kC3ujQHwfqtA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 11:34:26 -0700
IronPort-SDR: fcnOiKx5CD2lQDtzXqai7u53Hpm0UfTO77ZXZRNuNg25UkLxUihSYGieAJfgAJHi+JbFa99q0+
 hwLdlkwGsAmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; 
   d="scan'208";a="237980140"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2020 11:34:23 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGRu4-00CJSQ-VZ; Mon, 23 Mar 2020 20:34:24 +0200
Date:   Mon, 23 Mar 2020 20:34:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-gpio@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add Segey Semin to maintainers of DW
 APB GPIO driver
Message-ID: <20200323183424.GT1922688@smile.fi.intel.com>
References: <20200306132505.8D3B88030795@mail.baikalelectronics.ru>
 <20200323180632.14119-1-Sergey.Semin@baikalelectronics.ru>
 <20200323180632.14119-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323180632.14119-7-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2020 at 09:06:32PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> Add myself as a co-maintainer of the Synopsis DesignWare APB GPIO driver.

I see neither cover letter, nor first three patches. What's going on?

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16084,6 +16084,7 @@ F:	drivers/tty/serial/8250/8250_dw.c
>  
>  SYNOPSYS DESIGNWARE APB GPIO DRIVER
>  M:	Hoan Tran <hoan@os.amperecomputing.com>

> +S:	Serge Semin <fancer.lancer@gmail.com>

Are you sure you used a correct letter?

>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt

Had you chance to run parse-maintainers.pl to see if other fields are in order?

-- 
With Best Regards,
Andy Shevchenko


