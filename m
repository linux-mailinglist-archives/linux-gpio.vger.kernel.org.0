Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3726F3269E8
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Feb 2021 23:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhBZWWN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Feb 2021 17:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhBZWWI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2021 17:22:08 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352B9C06178B
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2021 14:21:26 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id ba1so6052444plb.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Feb 2021 14:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GxUJ2qExrQAW6kSkLGo88Wd6gDhve8/UVNS1OlhAqCM=;
        b=wy501qCfbVvyRLwgj7bVOh4004Z2e57xZzkdNRzB7tS3bQiSn04n1o9x9zwTz75oAp
         4+YRm15oO2K10rZtAcFgO1lG4NGqduAd7SBPIdvvT/oOAZWuhpjSmWoQ5tej4Ruo0u89
         zk61XmxDzxaCbjT/msMZVEFdSU0MmUirSmGKJ3jb2wCmman6P33jNo/644DpL1khGlSY
         Kwh1nhwU37RlX47DdDmerIzC7wpG6bzzCTyIHcmTHuLsF/+omQgIA0H/7f4d8ITTfRRc
         L0qSFvCMC39uVpiyrH6vfZ84cp04z+F31i8BM/H3v/Ao+CSd8L1+oeY7hpz6dwEL2PAq
         qiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GxUJ2qExrQAW6kSkLGo88Wd6gDhve8/UVNS1OlhAqCM=;
        b=Y89g25EinSrd+iQ5IOeoykv53kXdz6ZSWl7HEQpxKPpcO2wXDm0eEOqEz1l3lcUJPf
         X+bvbQYQSjwqC/Od7RME7j7wDurlF2/aacnXIuTQ0nLhgabCxaGpmAhKeLKqQ3Z912LT
         oZh6Hxa3vomWYjQHsvcwpAShXoIfukoSKiafDAVmvX+dBMwUurHWNZVN6ul6gwY6s9jV
         vhcePSGJn5e6fpoYfvnXhkrfLN4sw0tDWuqr8pPIk2kWXlpo4soR2ySG9MbHPtHShNbT
         mwJNqP/g0f4J18dgJwO91WRa2e2QVNmM+vvNiVqR1ynWsv33cloGrnGsaPaH/g3bGQYA
         BrLA==
X-Gm-Message-State: AOAM530+XHo/5MEdPUBwV34wBgf3e8O55fKGnRwN3ZfHgqX7kg6lXC0l
        R8k+wcF3bfXuJwh79+/G6HddTQ==
X-Google-Smtp-Source: ABdhPJzHYx1FA+WzPEILaSnpStbn+KLDFFqqQwKb0RK7vOWCoE/V0dyx7sm1xylslGzGWpkLV/3Q+g==
X-Received: by 2002:a17:903:30c3:b029:e3:c391:6ccd with SMTP id s3-20020a17090330c3b02900e3c3916ccdmr4943630plc.53.1614378085658;
        Fri, 26 Feb 2021 14:21:25 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:6aa6:aac2:3a17:e4e7])
        by smtp.gmail.com with ESMTPSA id u1sm6615772pfn.209.2021.02.26.14.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 14:21:25 -0800 (PST)
Date:   Fri, 26 Feb 2021 14:21:22 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 0/3] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210226222122.GA725305@x1>
References: <20210220202750.117421-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210220202750.117421-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 20, 2021 at 12:27:47PM -0800, Drew Fustini wrote:
> This series first converts the debugfs files in the pinctrl subsystem to
> octal permissions and then adds a new debugfs file "pinmux-select".
> 
> Group name and function name can be written to "pinmux-select" which
> will cause the pin function for the specified group to be activated on
> the pin controller.
> 
> The final patch in this series documents the debugfs files for pinctrl.
> 
> Notes for PATCH v8:
> - add 'Reviewed-by:' from Geert Uytterhoeven for pinmux-select patch
> - add 'Tested-by:' from Geert Uytterhoeven for pinmux-select patch
> - change pinmux-select format to '<group-name function-name>' based on
>   feedback from Geert
> - rephrase parts of documentation per Geert's comments
> 
> Notes for PATCH v7:
> - add 'Reviewed-by:' from Andy Shevchenko for pinmux-select patch
> - add 'Reviewed-by:' from Andy Shevchenko for documentation patch
> - add 'Reviewed-by:' from Tony Lindgren to all patches
> - change order of '#include <linux/ctype.h>' per Andy's suggestion
> - change PINMUX_SELECT_MAX back to 128 as I had accidentally changed it
>   to 50 and Andy pointed this out.
> - grammer fixes as suggested by Andy
> - rework assignment of fsel and ret from pinmux_func_name_to_selector()
> - rework assignment of gsel and ret from pinctrl_get_group_selector()
> 
> Notes for PATCH v6:
> - add 'Suggested-by:' for Joe Perches to octal permissions patch
> - add 'Reviewed-by:' from Andy and Geert to octal permissions patch
> - reword example in the pinmux-select patch per Andy's advice
> - indent the example output per Andy's advice
> - remove usage error messages as Andy advised it is too verbose
> - return -ENOMEM when write is too big for the input buffer per Andy's advice
> - handle whitespace before, in between, and after the function name and
>   group name as suggested by Andy
> - rename free_buf to exit_free_buf per Andy's advice
> - add documentation patch to series which documents the debugfs files
>   for the pinctrl subsystem including the new pinmux-select file
> 
> Notes for PATCH v5:
> - convert permissions from symbolic to octal for debugfs_create_file()
>   calls in core.c that Joe Perches pointed out I had missed
> - Linus W: please let me know if I should break this series apart as you
>   already applied an earlier version of octal conversion patch today [1]
> - switch from sscanf() to just pointing to function name and group name
>   inside of the buffer. This also avoids having to allocate additional
>   buffers for fname and gname. Geert and Andy highlighted this security
>   issue and Andy suggested code to use instead of sscanf().
> - switch from devm_kfree() to kfree() after Dan Carpenter warned me
> - remove .read from pinmux_select_ops per Geert since it is write only
> - add usage format to error when unable find fname or gname in buffer
> 
> Notes for PATCH v4:
> - correct the commit message in the second patch to reference function
>   and group name instead of integer selectors. Apologies for not fixing
>   that in v3
> - fix typos in cover letter
> 
> Notes for PATCH v3:
> - add Suggested-by: Andy Shevchenko to the "pinctrl: use to octal
>   permissions for debugfs files" patch
> - change the octal permissions from 0400 to 0444 to correctly match the
>   symbolic permissions (thanks to Joe Perches and Geert Uytterhoeven)
> - note that S_IFREG flag is added to the mode in __debugfs_create_file()
>   (thanks to Andy for highlighting this and Joe for suggesting I should
>   add a note to the commit message)
> - fix order of the goto labels so that the buffers are freed correctly
>   as suggested by Dan Carpenter
> - move from devm_kzalloc() to kzalloc() as the buffers are only used
>   inside the pinmux_select() function and not related to the lifetime
>   of the pin controller device (thanks to Andy for pointing this out)
> - correct the pinmux-select example in commit message to use the
>   function and group name instead of selector (thanks to Geert)
> 
> Notes for PATCH v2:
> - create patch series that includes patch to switch all the debugfs
>   files in pinctrl subsystem over to octal permission
> - write function name and group name, instead of error-prone selector
>   numbers, to the 'pinmux-select' file
> - switch from static to dynamic allocation for the kernel buffer filled
>   by strncpy_from_user()
> - look up function selector from function name using
>   pinmux_func_name_to_selector()
> - validate group name with get_function_groups() and match_string()
> - look up selector for group name with pinctrl_get_group_selector()
> 
> Notes for PATCH v1:
> - posted seperate patch to switch all the debugfs files in pinctrl
>   subsystem over to octal permission
> - there is no existing documentation for any of the debugfs enteries for
>   pinctrl, so it seemed to have a bigger scope than just this patch. I
>   also noticed that rst documentation is confusingly named "pinctl" (no
>   'r') and started thread about that [2]. Linus suggested chaning that
>   to 'pin-control'. Thus I am planning a seperate documentation patch
>   series where the file is renamed, references changed and a section on
>   the pinctrl debugfs files is added.
> 
> Notes for RFC v2 [3]:
> - rename debugfs file "pinmux-set" to "pinmux-select"
> - renmae pinmux_set_write() to pinmux_select()
> - switch from memdup_user_nul() to strncpy_from_user()
> - switch from pr_warn() to dev_err()
> 
> [1] https://lore.kernel.org/linux-gpio/20210126044742.87602-1-drew@beagleboard.org/
> [2] https://lore.kernel.org/linux-gpio/20210126050817.GA187797@x1/
> [3] https://lore.kernel.org/linux-gpio/20210123064909.466225-1-drew@beagleboard.org/
> 
> Drew Fustini (3):
>   pinctrl: use to octal permissions for debugfs files
>   pinctrl: pinmux: Add pinmux-select debugfs file
>   docs/pinctrl: document debugfs files
> 
>  Documentation/driver-api/pinctl.rst |  37 ++++++++++
>  drivers/pinctrl/core.c              |  12 ++--
>  drivers/pinctrl/pinconf.c           |   4 +-
>  drivers/pinctrl/pinmux.c            | 106 +++++++++++++++++++++++++++-
>  4 files changed, 149 insertions(+), 10 deletions(-)
> 
> -- 
> 2.25.1
> 

Does any have any additional feedback for any of the patches in this
series?

Thank you!
DRew

