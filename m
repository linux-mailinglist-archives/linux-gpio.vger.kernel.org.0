Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98FD32F1858
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 15:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbhAKOb6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 09:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730583AbhAKOb6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 09:31:58 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC78FC061794
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 06:31:17 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id v19so12600335pgj.12
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jan 2021 06:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=au19hpz7MhkW+dJ7+t97xs/z3l/V4IpV4lkO568SJVI=;
        b=MUCSUAFO88p0iR6fIKLPS6LcT7Sc7kJ8hAkFyw3kCW+fLFhsyqs8eeJmxsu4A2j827
         tV+TMhI77eCBZfNvy2y8++Igc+oxbzP51ohcVkeLyWdAAHSDBg60T7LNpJW7wyULvaNC
         OVpcDiT6cKBagUpMdqudKOg/j0odXLih7EiPI/aHlse6Q3kyYMfyo+u5nQPPADTyYUtG
         P3jY6jFVqwsFE/5jcSTOU0zSHddQd0agT7Fdqb1eTv8fYW6HqXHlBKf+OMP38Ksat5bF
         V6VtcMIHGMf322qJ6t0VbCsagZrInvsYOkZLEnZ6+VP2D9ynCInUMNhJWCyM0GUrWgM2
         7nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=au19hpz7MhkW+dJ7+t97xs/z3l/V4IpV4lkO568SJVI=;
        b=rHZlq7wY/0yDmrzCRKUQYMYeofJPpVIgu/b9DTaz84FxYuJ5G1QO36HurGuCsHOOrH
         Ky8dL/b0WS5jrY09WXvvlss3hVGdJU4nk4xi4gAqCnuxz/G0JmDel6jsm55iYLxEEZBU
         MYKlDlMri4zQSGQyPQ8xRT4XYN1COFrUaPpCxLp5waE4ALM+jzGBrLllEmYLFS8mf/NG
         txTAqxx7uIFe/3h0DRsySpyqahQnZQmxNcUIKutgkXieH6lqe8LHWSyOt440wCckK+wo
         4rEpHJNDrIJFZLRTDKApYoyj1H1/itbMDQEsserYHSwzaX1tI5rUSSOp3O8uKztmUIAU
         uoKg==
X-Gm-Message-State: AOAM531rTPg/+SJw8IE+S+zPMESgKllM3UMBTf0m+lyeIBo4DQZ+IPfw
        wQgOs9hauTbJE9+7tn6LkPo=
X-Google-Smtp-Source: ABdhPJxzHM5R2I1XrQoQ6MDWyoJ2pgVmMp6citRVbk2IRDI+O8L7bZxJrmJMimYiWIDFbKm3o2Eosg==
X-Received: by 2002:a62:2585:0:b029:1ab:7fb7:b965 with SMTP id l127-20020a6225850000b02901ab7fb7b965mr16444537pfl.2.1610375477414;
        Mon, 11 Jan 2021 06:31:17 -0800 (PST)
Received: from sol (106-69-181-20.dyn.iinet.net.au. [106.69.181.20])
        by smtp.gmail.com with ESMTPSA id n7sm18605550pfn.141.2021.01.11.06.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:31:16 -0800 (PST)
Date:   Mon, 11 Jan 2021 22:31:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH 3/6] treewide: rename BIAS_AS_IS to BIAS_NONE
Message-ID: <20210111143112.GA1036910@sol>
References: <20210111133426.22040-1-brgl@bgdev.pl>
 <20210111133426.22040-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111133426.22040-4-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 02:34:23PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> When inspecting the current bias setting of a GPIO line, the AS_IS name
> of one of the possible values really means that there's no bias so it
> should be renamed to NONE for clarity.
> 

I disagree this one, as the BIAS_NONE can be confused with BIAS_DISABLED.

Its meaning depends on whether you are setting or reading the value.
On write, for backwards compatibility, it means don't change the bias
from what it was previously, hence the AS-IS naming.
On read it means unknown, as the uAPI can't determine bias setting
unless it set it itself - so if it is set by DT then the cdev can't tell.

If you are going to change it I'd go with BIAS_UNKNOWN.

Cheers,
Kent.

