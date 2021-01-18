Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2712F970D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 02:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730676AbhARBB5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Jan 2021 20:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730504AbhARBBw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Jan 2021 20:01:52 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB24C061575
        for <linux-gpio@vger.kernel.org>; Sun, 17 Jan 2021 17:01:12 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id u11so3436867plg.13
        for <linux-gpio@vger.kernel.org>; Sun, 17 Jan 2021 17:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V/sHVOw7J/xEv8RCZaiPOWWJ6nye+JImrTTDsfFwrjc=;
        b=HmgWGYR0Il4ln3uruX58oPdwUeHJzP+kBjkuqoK3+WtfLHV53WM9RDqQrSS3IwIHzH
         VUyO3j2j6hvSRmgofCcnupeFCP5XC5rQ606CCoRd01Om3NQ/F89OyFxISCDCWt+t5Et7
         5xK1EhNEl4V6TEZ+rNgYoLII60944dsceZhqsjvAhSDG9DFxGMCDlFnJcAYp8xnNdZ/J
         pp+UjZrd1du+8k1zeb/eDpZ52HHfnT4ULlo7PPJZi4B5giqBwdWegChuN9uPu6FC2Jc5
         u8rsqMiXX0ZLBUkC2w1rXirSMQs4dpDqt5x14KnylnTQm8dGeoYOdS9NxZCylHxgZuHu
         t6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V/sHVOw7J/xEv8RCZaiPOWWJ6nye+JImrTTDsfFwrjc=;
        b=rFUoCOSwWpsqAsjb/NbqdTZuSm3FWVd1TIIulrDvqdg/ZxPm0UNK4tgXIqTSQaSRP3
         qcYiYGQozHqkvO83a3kaXNnuzaBOdEtbq9FKWK0MAPNME0X3HfHHpfPf+UpbI4S9Ksb7
         texx/3x0vy7upQAfYtap/GHKs6WxSSFQmsSLp/L6rjjaoOPWUhC4R0N/dvKdZb4pnth+
         v/Zz/Vk4TMFJLngAsgtkfNN6ra88wDDwJ3hHKcmCt18w6kVl7CRKfMuSH0cp3NZ0p+4E
         LuzJtysAXE9+FwgJcrAe+LOy0m83f6BTlbTyiu1AHvF3Z1OsaJpoZBFFX2PmwlGnDVvx
         bVLg==
X-Gm-Message-State: AOAM530ZiR+iTDFYKm5tEsj2Xw5pCE5KrGnZw9YDq/GLyCXe94inb0Fq
        tflph/JlHv63geY007kEOBSj+sXsXNs=
X-Google-Smtp-Source: ABdhPJwv2+9t7FuSCL7sxvBUX7gs5Xt7hA7cia/igqJwHTd9894sjbZ3kme3uZBH5vRRMKU53LffmQ==
X-Received: by 2002:a17:90a:6842:: with SMTP id e2mr23451883pjm.190.1610931671633;
        Sun, 17 Jan 2021 17:01:11 -0800 (PST)
Received: from sol (106-69-181-154.dyn.iinet.net.au. [106.69.181.154])
        by smtp.gmail.com with ESMTPSA id x23sm13634926pgk.14.2021.01.17.17.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 17:01:10 -0800 (PST)
Date:   Mon, 18 Jan 2021 09:01:06 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH v2 0/7] treewide: remove more cruft and add
 some improvements
Message-ID: <20210118010106.GA9319@sol>
References: <20210115103018.27704-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115103018.27704-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 11:30:11AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This is another batch of improvements to libgpiod before we overhaul the
> data structure model.
> 
> The last patch adds the kernel uapi header to the repository so that we
> no longer depend on its presence on the host system.
> 

+1 for this set, other than my specific comments.
I'm all for a small core C library.
And there are more drastic changes to come, so any problems missed
here can be picked up there.

Cheers,
Kent.
