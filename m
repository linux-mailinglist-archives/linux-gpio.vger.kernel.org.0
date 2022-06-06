Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A1153E6F0
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jun 2022 19:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbiFFKKv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jun 2022 06:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbiFFKJX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2022 06:09:23 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2588A327
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jun 2022 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654510061; x=1686046061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e2ufwbgqEGLxgopLFmelfHt05TR9BK/m6zkDPCmIWAg=;
  b=ieqhRMw2YJMVw9oKkouhFtCogEQ1rB7DQPSt+cTkkfrsUJ+Dmat8s+OM
   gFPes9sdYaNitFsGlhYqGj8ixoRS5PVxSQZrSp/Nqp5ma2CxjobjUs44i
   3rQJ3qmyPxAmf56Jlq/su2OBW5yX4NOp2mVd8Az8yklF4AIUs953+avbt
   C7X6dQYanksVUDpPvInpNJCYCSnYVA8WFYDfD1CPETFSOGx50w8mSFyVB
   qjvALwNsBsznAMorg5pF+oRhu7jp4MRIpIYzeqqqJx+yD+3VAe4n4D2hY
   vz3hsljdpayfV/P8bJcAkQep9xKBjfH/+lzhw2WdfgFTw8/PwxAAkFwjl
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="276589071"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="276589071"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 03:07:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="554394698"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 03:07:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ny9dt-000UXC-Tf;
        Mon, 06 Jun 2022 13:07:25 +0300
Date:   Mon, 6 Jun 2022 13:07:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org,
        mika.westerberg@linux.intel.com
Subject: Re: [PATCH v6 0/6] Enhancements to AMD pinctrl and implementation of
 AMD pinmux
Message-ID: <Yp3R3RrH2/SGx6oo@smile.fi.intel.com>
References: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
 <CACRpkdaQQxSO+dSbsFdgmzprJTexepmtBqbuX-X-XP2zVzepsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaQQxSO+dSbsFdgmzprJTexepmtBqbuX-X-XP2zVzepsw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 04, 2022 at 12:12:31AM +0200, Linus Walleij wrote:
> On Wed, Jun 1, 2022 at 5:29 PM Basavaraj Natikar
> <Basavaraj.Natikar@amd.com> wrote:
> 
> > Changes include enhancements to pinctrl-amd and implementing
> > AMD pinmux functionalities.
> >
> > v6:
> >         - avoid nested conditionals.
> 
> Patches applied for the next kernel cycle (v5.20).

Can you provide an immutable tag / branch, so I can pick it up to my tree and
develop patches for Intel drivers based on patch 1 from this series?

> Special thanks to Andy for reviewing and guiding!

You're welcome!

-- 
With Best Regards,
Andy Shevchenko


