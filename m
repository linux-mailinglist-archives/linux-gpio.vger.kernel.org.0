Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 261DD7985B6
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Sep 2023 12:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242998AbjIHKWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Sep 2023 06:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243019AbjIHKWk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Sep 2023 06:22:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8941C1FE2
        for <linux-gpio@vger.kernel.org>; Fri,  8 Sep 2023 03:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694168523; x=1725704523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H9H1F/K+wwkCrH4BMLP/OC2KyvR+NLhkUuK17wV9Iac=;
  b=Fxszu5b1+m9vQOrDamyL/VDTE7tYXwk0OtmR8oPXp+FqKeFkoB47OGXH
   tflUTVxF6nMJRPIx3b/n6OATqvlj3Q8zW9Y44uYadkgxAqe0moy6EFZDl
   ZIyYhRegrf3nHL0FgCprNLsvsPypPJb7cc4o4ZMM1cWWh5ADgvL/gwqjp
   rcHx6euAirW76vxibQ8BK+e3iMGntQpW5o4crjh+Ggwp1/fOECj8MkZRs
   lMVORzY17L+FSbqfKZ2dpDaOh59gt7hd0+gVpA3PfikIAptUAp0qRnmkV
   YhRicdgmSeRqdyBzqqMqnG3Gmo47RdFVrtd9e0Ktm2aOb271/8ydmP3hz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="374995737"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="374995737"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 03:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771706552"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="771706552"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 03:18:31 -0700
Date:   Fri, 8 Sep 2023 13:18:28 +0300
From:   Raag Jadav <raag.jadav@intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: baytrail: consolidate common mask operation
Message-ID: <ZPr09Fj+q+cO3XIv@black.fi.intel.com>
References: <d164d471-5432-4c3c-afdb-33dc8f53d043@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d164d471-5432-4c3c-afdb-33dc8f53d043@moroto.mountain>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 07, 2023 at 12:53:54PM +0300, Dan Carpenter wrote:
> Hello Raag Jadav,
> 
> The patch 4cfff5b7af8b: "pinctrl: baytrail: consolidate common mask
> operation" from Aug 8, 2023 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/pinctrl/intel/pinctrl-baytrail.c:1023 byt_pin_config_set()
> 	error: uninitialized symbol 'db_pulse'.

Thanks for the report.
I have a fix in internal review, will send it out soon.

Raag
