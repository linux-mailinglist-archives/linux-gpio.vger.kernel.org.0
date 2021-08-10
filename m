Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E08BA3E5E7E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 16:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242236AbhHJO6t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 10:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242163AbhHJO6t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 10:58:49 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF24C0613C1;
        Tue, 10 Aug 2021 07:58:27 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so22341217oti.0;
        Tue, 10 Aug 2021 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0s6aRJbkHeu7Oyoe9ZAeG0S7tHDLWONsEZR+I8wRUwo=;
        b=kCGa7uhciI1+nEKgxmzKnoLK+IeBq4+0sdJL9Aj1LLsZfgPt9XzdlZ+NDcFMAjr+Bb
         mr8pcKGUdrRyCDSb6TVhVYbg4wvlLY3Q7rrKW9x2ZOlKI9yn3UuoF6IN49O9eVw9/7G/
         bx62CyFFAhiaASmT+VaD3BzkUTCaUgLRyjb6FqiLSnlaU2/eG6boPARhJrArsxtTkOrD
         daTeKSXW7DGIpOegHdhhKW1pib4XaYEooLCyA6zyh/a1TKv+G0x9B1ZpC5pi67zlSz0u
         l34wlobKEcS1Pd1pF4UxPfMoC6KMvmjt+upvZF6KynrbB6qZPig8eBO5IXfhMpn9zXoG
         9rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0s6aRJbkHeu7Oyoe9ZAeG0S7tHDLWONsEZR+I8wRUwo=;
        b=fmw7uh4dHRojxiJpT3OtKr73kAN1iWLbtmL01yrF5zmSPqV579fNgFG+lSPDmXWm75
         /TFjFoAvgwMSCrk7A/ZkBtPm8AR4wxGG8mKHEJ4YFO1vLsPmpAPCDpwf/UqXOi9F9BqJ
         HbtTaB/u31vujVUaIkVQK37z6DwDOmhHSMuV08J0K7WLHVtSwGaHM/2cbvuXhsBGqwzH
         yaFKSmimnkCHPM4BQwtjz5B/yLf/xSlTehbLZtt8z90pkTwTcCAYiCCvj6eT9vKsghZG
         2bdLYuLuGpFAMjUaKfGEww61zG72Li6NIZ9+NwVW/1yIrf/2BAvDYSC3t4pBZdnExUVd
         SiYg==
X-Gm-Message-State: AOAM531+kp0bU6RSWGNRnO1WfWEzIrD5lENHYY7cZK16fdkAzH56b3Nz
        kxoyuDUZB0Alvf9KoFGTexGipAValI/rkKwTi2c=
X-Google-Smtp-Source: ABdhPJw0LIZgu/Az/gmZoyjHRrMOSSrNXK1FGRZglOWP8tn3P0iYXCz0iM88YagD40VyM8PtnNd1GVG6f9+CZU+8QO4=
X-Received: by 2002:a9d:6003:: with SMTP id h3mr18504468otj.42.1628607506635;
 Tue, 10 Aug 2021 07:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210810004021.2538308-1-chrisrblake93@gmail.com> <9efa5687-f35c-bfcc-43e9-58becbb69d68@redhat.com>
In-Reply-To: <9efa5687-f35c-bfcc-43e9-58becbb69d68@redhat.com>
From:   Chris <chrisrblake93@gmail.com>
Date:   Tue, 10 Aug 2021 09:58:15 -0500
Message-ID: <CALpBJjr7kDH-8VwWuLMTorsAMrdJEAABDiW==5Ei=jHK8Qn_2w@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: add meraki-mx100 platform driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Hans,

Thanks for the explanation and fix-up, it's appreciated! I'll be sure
to do more testing my next go around.

Regards,
Chris B
