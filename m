Return-Path: <linux-gpio+bounces-10631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0456598BEA5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 15:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365A31C21A05
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 13:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70980224CF;
	Tue,  1 Oct 2024 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I+kNij4y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E28F282FB;
	Tue,  1 Oct 2024 13:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727790975; cv=none; b=T8LToI97xGeXmxoZXmv6lz2nf0IJb1hVmt7CIzxttI6QIatOBojsecuyxy6IhM65p9Y045h83/srqUFGA1tURrN7cfQuy9/fcVKYEiGTOQZL7IBv2mHlKTA9m8Jb9sEDBTMGp77tTi3rNkrE1yy0Wu3uo5IzW9jta+FD12rSwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727790975; c=relaxed/simple;
	bh=XZ6Q7aNO3ArLbrN90Qf4WFXgDw694nRGtjX6Ee5uoro=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WKjduOCPbCra2odrmn2yB9gZ1g4u7fFhgTk33twyNK5WgivBvBGmWGznMxdu1mcTCmpO9o/lCIDilqXQ8l3iBRTz89h2P92glirHPLf5VkpAfE794B+ZTyM9vXi8vJlA6ZLchEnAUqUTTrv4mPKr9tj6hsBYy2tylr9nzLBCRB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I+kNij4y; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 491Du28p004536;
	Tue, 1 Oct 2024 08:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727790962;
	bh=6m2oEEBm8D8mZlqx8bHpD3+QmDhnwC7gIvkytb0oV2U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I+kNij4yFry0Y1zr3t9z8x+CHJ+jBqIEeqTXCltY3Clhp5B/lAmY/HVCKguxgOQpp
	 ESsBjtW7lCac/G0IBK8Eqf5Lx4igTS4E6nuTz4wTaK8H1zla2HuGA400OTYleftAw1
	 uwgL5m9a3cwPx6HeLG70JjCvu8d5aFtHd0PzJukM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 491Du2mL043481
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 08:56:02 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Oct 2024 08:56:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Oct 2024 08:56:01 -0500
Received: from [128.247.81.173] (ula0226330.dhcp.ti.com [128.247.81.173])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 491Du1jZ001870;
	Tue, 1 Oct 2024 08:56:01 -0500
Message-ID: <46137193-ca6f-483a-958a-96e799e0d729@ti.com>
Date: Tue, 1 Oct 2024 08:56:01 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpio: davinci: allow building the module with
 COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>, kernel test robot <lkp@intel.com>
CC: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
        <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240930115116.54626-1-brgl@bgdev.pl>
 <202410011000.hRJ0JPdV-lkp@intel.com>
 <CAMRc=MeY_+ZvEgiNegxD012i1NaFN04=8LTzwyUWod_9TRXb-g@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CAMRc=MeY_+ZvEgiNegxD012i1NaFN04=8LTzwyUWod_9TRXb-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10/1/24 4:17 AM, Bartosz Golaszewski wrote:
> On Tue, Oct 1, 2024 at 4:35 AM kernel test robot <lkp@intel.com> wrote:
>>
>> Hi Bartosz,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on brgl/gpio/for-next]
>> [also build test WARNING on linus/master v6.12-rc1 next-20240930]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-davinci-use-generic-device-properties/20240930-195251
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
>> patch link:    https://lore.kernel.org/r/20240930115116.54626-1-brgl%40bgdev.pl
>> patch subject: [PATCH 1/2] gpio: davinci: allow building the module with COMPILE_TEST=y
>> config: sh-randconfig-002-20241001 (https://download.01.org/0day-ci/archive/20241001/202410011000.hRJ0JPdV-lkp@intel.com/config)
>> compiler: sh4-linux-gcc (GCC) 14.1.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011000.hRJ0JPdV-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202410011000.hRJ0JPdV-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/gpio/gpio-davinci.c:652:34: warning: 'davinci_gpio_ids' defined but not used [-Wunused-const-variable=]
>>       652 | static const struct of_device_id davinci_gpio_ids[] = {
>>           |                                  ^~~~~~~~~~~~~~~~
>>
> 
> Weird, this doesn't happen on x86 defconfig with OF disabled and W=1...
> 

Use of `of_match_ptr` needs removed here. All drivers where their
of_device_id table is not conditionally defined based on CONFIG_OF
need that helper function removed. There are a lot of instances
of this issue..

Andrew

> Bart
> 
>>
>> vim +/davinci_gpio_ids +652 drivers/gpio/gpio-davinci.c
>>
>> 0651a730924b17 Devarsh Thakkar   2022-06-13  648
>> 8507f35447e6e5 Min-Hua Chen      2023-06-09  649  static DEFINE_SIMPLE_DEV_PM_OPS(davinci_gpio_dev_pm_ops, davinci_gpio_suspend,
>> 0651a730924b17 Devarsh Thakkar   2022-06-13  650                         davinci_gpio_resume);
>> 0651a730924b17 Devarsh Thakkar   2022-06-13  651
>> c770844c3e30be KV Sujith         2013-11-21 @652  static const struct of_device_id davinci_gpio_ids[] = {
>> 0c6feb0796ea64 Grygorii Strashko 2014-02-13  653        { .compatible = "ti,keystone-gpio", keystone_gpio_get_irq_chip},
>> 6a4d8b6bd27932 Keerthy           2019-06-05  654        { .compatible = "ti,am654-gpio", keystone_gpio_get_irq_chip},
>> 0c6feb0796ea64 Grygorii Strashko 2014-02-13  655        { .compatible = "ti,dm6441-gpio", davinci_gpio_get_irq_chip},
>> c770844c3e30be KV Sujith         2013-11-21  656        { /* sentinel */ },
>> c770844c3e30be KV Sujith         2013-11-21  657  };
>> c770844c3e30be KV Sujith         2013-11-21  658  MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
>> c770844c3e30be KV Sujith         2013-11-21  659
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
> 

