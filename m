Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2422829F5C9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 21:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgJ2UD5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 16:03:57 -0400
Received: from mga06.intel.com ([134.134.136.31]:31257 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgJ2UD4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 16:03:56 -0400
IronPort-SDR: EwfgsIbmb3SZaUnh5rKzYV1oF4b6pp3HTx/wvW5Jt3ClMX5U90OUXAsFsRTdYrq5nBGVfCbTbh
 +gezUgUtaSAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="230139331"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="230139331"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 13:03:55 -0700
IronPort-SDR: cYgItJTh5PFKMoAylsu9n5qCWDOXLqtcEiqLZVZ3oq/S6uE6/XixUhmb71J64T0Tf6m0r6oo9e
 nApdWp3cPZeQ==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="304704084"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 13:03:53 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kYEAJ-001UF9-ML; Thu, 29 Oct 2020 22:04:55 +0200
X-Original-To: andriy.shevchenko@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
        by smile.fi.intel.com with IMAP (fetchmail-6.4.12)
        for <andy@localhost> (single-drop); Mon, 26 Oct 2020 16:45:07 +0200 (EET)
Received: from orsmga006.jf.intel.com (orsmga006.jf.intel.com [10.7.209.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id 7F754580100;
        Mon, 26 Oct 2020 07:40:28 -0700 (PDT)
IronPort-SDR: 8KedLQq5gfsEpReMVm817dT6hpAAjEZkHcw2bo3/44TviZUv3nGg4Q+pjzsAnuKvp3ESZJAYLd
 UnVrhSS7gOKQUAt3wRBOWCz578UbehUlk=
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="322571858"
X-IronPort-AV: E=Sophos;i="5.77,419,1596524400"; 
   d="scan'208";a="322571858"
Received: from fmsmga102.fm.intel.com ([10.1.193.69])
  by orsmga006-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2020 07:40:27 -0700
IronPort-SDR: j88ImjhNnuKJUl/qkBMj2Q07nlzW1dyGHPC2dBQSVxeZHu8B9rX44F2PTJ9oXfejKfkrUSxDkN
 oY9QebJI/ycFxoSY//wNET+dkLVonP6PE=
IronPort-PHdr: =?us-ascii?q?9a23=3Ah5kpCBUMn7A7EJF5/vyx8wi6v9DV8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYZRSEuKdThVPEFb/W9+hDw7KP9fy5BipQvt3Y6TgrS99lb1?=
 =?us-ascii?q?c9k8IYnggtUoauKHbQC7rUVRE8B9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUh?=
 =?us-ascii?q?rwOhBoKevrB4Xck9q41/yo+53Ufg5EmCexbal9IRmrrwjdrMobjIltJqos1x?=
 =?us-ascii?q?fCv2dFdflRyW50P1yYggzy5t23/J5t8iRQv+wu+stdWqjkfKo2UKJVAi0+P2?=
 =?us-ascii?q?86+MPkux/DTRCS5nQHSWUZjgBIAwne4x7kWJr6rzb3ufB82CmeOs32UKw0VD?=
 =?us-ascii?q?G/5KplVBPklCEKPCMi/WrJlsJ/kr5UoBO5pxx+3YHUZp2VNOFjda/ZZN8WWH?=
 =?us-ascii?q?ZNUtpUWyFHH4iybZYAD/AZMOlXoYnypVsAoxW9CwexGu3g1iRFhmPq0aAgz+?=
 =?us-ascii?q?gtDR3K0Q4mEtkTsHrUttL1NKIKXO2pyqnH0DXCZO5L1zf99ofIbAwuofGSUr?=
 =?us-ascii?q?J2csrRzlQkGgTfgVWWtIPkPymZ1v8Ns2eF8epvSeKvhHAhqwFypTii3cgsio?=
 =?us-ascii?q?zTiYIUzlDI7zl2wIEwJdChTkNwfNGrHodKuS6AK4t2Xt0tQ3tuuCsiy7AIuY?=
 =?us-ascii?q?K2cDYKxZk62RLSaOGLf5aV7h//WuifITV1iX15dL+hhhu/7EutxvD4W8e03l?=
 =?us-ascii?q?tErjdJn9vCu30O2BLe5M6KQeZz8Eem3DaAzQHT6udcLEA3i6XbMZghzaA0lp?=
 =?us-ascii?q?YJtkTDBCD2lUPrh6GVbkUp4vak5/jjb7n8pZKRN5V4hh/jPqkvgMCyAOY1Pw?=
 =?us-ascii?q?4TVGaB4+u8zqfs/UjhTbVKkPI2lq7ZvYjfJcsBp665BxZZ0p4h6xqiFjum3t?=
 =?us-ascii?q?UVkHsdIFJKfxKHiIfpO1XQL/ziEfi/hFGsnC9qx/DAILLhHo3AImbfnLrlZ7?=
 =?us-ascii?q?pw6E5RxBAtwdxC5p9YELAMLfDrVk/0rtPYDxs5MwKuw+bgDdVwzpkRWWSSDa?=
 =?us-ascii?q?6ZKq/Sql+I6fwxI+aQZI8apjD9K/si5/P1gn85nEUSfait3ZcNdH+4GfFmL1?=
 =?us-ascii?q?2DYXXwmtcBDXsKvg0mQePwjl2NTCRTZ3eyXq4m/TE7CJypDZnfSYCtnrOB2i?=
 =?us-ascii?q?S7HppNa2BCC1CMF2rodoqeV/cNbiKSPtFukjgeWbe9TI8h0AmktBXmxLp/Mu?=
 =?us-ascii?q?rU5ioYuIrm1Nh05O3cjws+9DJqAMSGz2GCUXt0kXgWSD8s06Byukh9ylaF0a?=
 =?us-ascii?q?hljP1UD91T5/VVUggkMZ7Q1fB1C9f3WlGJQtDcYVCqU52dATwvRdI8xdwJKx?=
 =?us-ascii?q?J0Hdm4jwGFxCqnHbQVmrqIA7Qw86TBzz7wIdpwzzDN06x33Hc8Rc4aHGuql+?=
 =?us-ascii?q?ZE9wXNDI7ElUae3/Kjc6gNmjXN+XmIzWeIv0ZwXwt5UKGDVncaMBiF5e/l71?=
 =?us-ascii?q?/PGuf9QY8sNRFMnIvbcvNH?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0GwCgDz3ZZfdEPYVdFgHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgU+BdYElVTMshDyDfo0UkEGLZAsBAQEBAQEBAQEJJQoEAQE?=
 =?us-ascii?q?ChEgCggwCJTgTAgMBAQsBAQECAgEBAQIBBgICAQECEAEKCwwHJ4VqDII3KQF?=
 =?us-ascii?q?zgQMBAQEBAQEBAQEBAQEBAQEBAQEBARUCDVQgKQEBHQEBAQECARIRHQEbBBk?=
 =?us-ascii?q?BAwELBgULAwoCAiYCAiIBEQEFARwGEyKDBYJKAQMOIAUKmiuBBD2KO3aBFQU?=
 =?us-ascii?q?BF4MFBYE0ARFDgjsKGSgNYgOBNgIBBhJ8KoQWgTqHaQ+BTT+BETaCWj6HVIJ?=
 =?us-ascii?q?fBJMVpEYrB4JtgQ8EC4dmkXUioV6dDoEllVsPI4FIgXtwgQGCOBM9GQ2OH4N?=
 =?us-ascii?q?xhRSFREIwAgEBATMCBgoBAQMJjkgBAQ?=
X-IPAS-Result: =?us-ascii?q?A0GwCgDz3ZZfdEPYVdFgHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?U+BdYElVTMshDyDfo0UkEGLZAsBAQEBAQEBAQEJJQoEAQEChEgCggwCJTgTA?=
 =?us-ascii?q?gMBAQsBAQECAgEBAQIBBgICAQECEAEKCwwHJ4VqDII3KQFzgQMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBARUCDVQgKQEBHQEBAQECARIRHQEbBBkBAwELBgULAwoCA?=
 =?us-ascii?q?iYCAiIBEQEFARwGEyKDBYJKAQMOIAUKmiuBBD2KO3aBFQUBF4MFBYE0ARFDg?=
 =?us-ascii?q?jsKGSgNYgOBNgIBBhJ8KoQWgTqHaQ+BTT+BETaCWj6HVIJfBJMVpEYrB4Jtg?=
 =?us-ascii?q?Q8EC4dmkXUioV6dDoEllVsPI4FIgXtwgQGCOBM9GQ2OH4NxhRSFREIwAgEBA?=
 =?us-ascii?q?TMCBgoBAQMJjkgBAQ?=
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="164434296"
X-IronPort-AV: E=Sophos;i="5.77,419,1596524400"; 
   d="scan'208";a="164434296"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-pj1-f67.google.com ([209.85.216.67])
  by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2020 07:40:26 -0700
Received: by mail-pj1-f67.google.com with SMTP id g16so3360445pjv.3;
        Mon, 26 Oct 2020 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AuWslfBN5ejzhZENZmoJOy4rO2zUtnzh/8/yM7SxCRQ=;
        b=CCf7DOR6Nr9EQiJeWO+jPQjrERcv/FfbWqJComunMyHUSr0gyLfaYpgVJ9nyXaA3a1
         yyqu335QwzRqbaNY4/sy96qCSFy6Cd8HoS7rpcWi4PFChWkF9Yd02Yfi8yKXNzpFoTfm
         Xri43WWPRv5dCUfIWoiQwK21C4YvcotxG4pxbjg7RA96dsy3cpZvs/H8X2PptQvLB6R7
         bi9NmPQWlJ2/5BCcEFZJbyqIN4kxGki8Z9hm1p9n2Sth1Xjf8YgW2gG7ELmicjSt3Nbx
         RxRpXF0T9SYBpCmTsjqekrALtMqsYoVn3hauPILucN3DFRYuynwkA1reZ/7nkbcRhw97
         05ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AuWslfBN5ejzhZENZmoJOy4rO2zUtnzh/8/yM7SxCRQ=;
        b=d7M635OAmqoaWWr+6/9TCc4zevq5mTu9kJ6T/TKVRxzsRGIFQt3K2Dm+LUyqIvnav2
         dwrBzr8cXxOrsYaINKotYqBLwxusDEegIZQRxqURtYwB95XYg5A2CVMUzMsU9Sdep08d
         Rz48gHuSJ2scw/7jm4Plv27dJDsFhJuj73RhOZitEPhwOL7giH/xrA8PQQFk3R0azJzI
         MgmrrcuptWi/NvlbdcgXy3yzdzOcHtqG3lDpphNYl0jDq11NZgd588oMktN1CJqXXdxz
         EltPGywN6c4lF5OJKFz/Qgkc4JnVwkV7loaYdGDmEx2ac6q5q1ZoLaGkmUxZ7DIk7MhW
         meRA==
X-Gm-Message-State: AOAM532LYcjg5WBiu3KMivzdLc5nylEbYFpSUhAaH3h+wgumB/pHno9j
        OA8hKpGoBXzJaoi1N74gsbJpI7nQT8LDTaK6OJ8mzRaOD+c=
X-Google-Smtp-Source: ABdhPJxhdq6fQIJMIAxyC9X5Nj65uc7tMg2ouBcSuZSgOVYewIYlotcCsv4l2ERNs/lBZWA+I78nq5u7wRipF+8F1EA=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr16486951pjs.181.1603723225595;
 Mon, 26 Oct 2020 07:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com> <20201022170319.GJ4077@smile.fi.intel.com>
In-Reply-To: <20201022170319.GJ4077@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 16:41:14 +0200
Message-ID: <CAHp75VfqQ97oLfRe03pkAbmoS6hq3P7ZScS7Jr1Y=ZAYgWmP7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: acpi: Respect bias settings for GpioInt() resource
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus@black.fi.intel.com, Walleij@black.fi.intel.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 22, 2020 at 9:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Oct 22, 2020 at 07:58:45PM +0300, Andy Shevchenko wrote:

> Missed comment as per v1:
>
> This one highly depends on Intel pin control driver changes (for now [1],
> but might be more), so it's probably not supposed to be backported (at least
> right now).
>
> [1]: https://lore.kernel.org/linux-gpio/20201014104638.84043-1-andriy.shevchenko@linux.intel.com/T/

I probably have to elaborate what above implies from integration p.o.v.

I think the best way is to collect tags from GPIO maintainers and I
can incorporate this into our Intel pin control branch which I will
share with you as PR against GPIO and pin control subsystems.

I'm also all ears for alternatives.

-- 
With Best Regards,
Andy Shevchenko
