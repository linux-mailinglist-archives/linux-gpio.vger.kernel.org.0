Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D5E200B62
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 16:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgFSO0c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 10:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgFSO0b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2020 10:26:31 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC92C06174E;
        Fri, 19 Jun 2020 07:26:31 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w7so7794626edt.1;
        Fri, 19 Jun 2020 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8bSED8zl4CrcAER1VVpY4315eH4pyEInk1CBmUlC8tM=;
        b=iJvxOSObVw2uCB3dpRtcU1+kdibcBS4VTzuVUkFDbJVkDGJR2vlGw1hTcAs3wM2Tam
         XGi4UOs8uNemmHbnWqlm0CCGzeFJ81SiGAP0SwH7Pq2QUFjq0FJY5CzfOnE0Tcvvxa2m
         zuXPu5ApOTcKe/fumgtPG45HXts8sUHlDVrWYW02ekrxE9PYZ1ywUt16YRcoS/I3jUvL
         91dteczkbB3+8EXmotE3WGfHl++X8J55oGhOmEYbvRuO5ckaTbuRvRyHKFPfe8f02czo
         lyY6L3nu3z9lFdHy1m0520iP8gG50EdpjIO7ycRH5byCsniK2u7Gtpwq+FFQI5OhqFqN
         xmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8bSED8zl4CrcAER1VVpY4315eH4pyEInk1CBmUlC8tM=;
        b=OrdK/FQAzovE2j5cn4l10Qjlj66w63Jq/elSrXE4RpeK8BZtWl7f87/2EpL6acdSsp
         dTVW3Q40LxrjITZUdcdKHC+gmlmO04hkw/DZs1+CyQUkFrS5H+H3aHoiqHlb8eAZvb2U
         JH+dhkBgTMYTTjRSvZSDTTS1v/y+a17gBimZSOyrv/KAuCuQEh1ZRgySxCA5KhmCqIKP
         HkqGtUzGjFZ0YdvDBGMOC5shrg7hjkEPeylqiNmOGygrTIPABdw8dAzAOLLGuS9ISNp2
         JOu68VrOlBvjB1O5QQmRv3Bos5VuXvytgU9Fbp7wO4a6Xsh2ajJjh4oz24ThH/n1J6eg
         QruA==
X-Gm-Message-State: AOAM531sbVsm4xm3cb4qKdXtzrDg2DJIOgMCzzQlwImEh4fg0mtNwe+y
        f1yRdQopgZW96GTz+1DvA2M=
X-Google-Smtp-Source: ABdhPJyRnKu5OL+gzHHN41FCxTU48KdilWSjIzi6WQc3xDaIKuUdLn5JhaB8ICPJhCHJj3DTR4VdSA==
X-Received: by 2002:a05:6402:a42:: with SMTP id bt2mr3539290edb.42.1592576789902;
        Fri, 19 Jun 2020 07:26:29 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:904f:be8d:1d92:9974])
        by smtp.gmail.com with ESMTPSA id j16sm4736461edp.35.2020.06.19.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 07:26:29 -0700 (PDT)
Date:   Fri, 19 Jun 2020 16:26:28 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     kernel test robot <lkp@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        kbuild-all@lists.01.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <20200619142628.burfxyjoe5uouzuz@ltop.local>
References: <46c05c5deeada60a13ee0de83c68583d578f42fd.1592224129.git.syednwaris@gmail.com>
 <202006160420.iatdr9ab%lkp@intel.com>
 <CACG_h5oiA8mDpTjtyGFYR4eptbxppN9tq+2wUj8T1hsbZ5h47A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACG_h5oiA8mDpTjtyGFYR4eptbxppN9tq+2wUj8T1hsbZ5h47A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2020 at 11:27:18AM +0530, Syed Nayyar Waris wrote:

Hi, 

> Regarding the compilation warning reported above:
> 
> "sparse: shift too big (64) for type unsigned long" at line 639
> "sparse: invalid access past the end of 'old' (8 8)" at line 638
> 
> Kindly refer to the code above, at these line numbers.
> 
> I am in the process of fixing this warning. But what would be the fix?
> ? At the moment can't think of a code-fix to make the compilation
> warning disappear (specially at line 639). Can anyone please explain
> to me the meaning of the compilation warning more deeply?

This error message is caused by sparse doing the check too early.
There is thus nothing to be fixed for it in this code.

Best regards,
-- Luc
