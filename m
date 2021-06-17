Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870103AA9C0
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 05:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhFQEBs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 00:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbhFQEBq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 00:01:46 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 380F3C061574
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 20:59:04 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 13-20020a17090a08cdb029016eed209ca4so3064113pjn.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Jun 2021 20:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a5D+ny1Y0c3O7KxzHuyI+M5mGXvaRgQ84CvvtncVlG0=;
        b=fRcFPkiIxPDt9py7J1PQBOFWa8GEY8lHPvIBnBm1ce3CL3iHZHu/UZCEhEGJOVVCaA
         VHKOkUgSyIJQ2Ruk0A2HflJ0G72K5plXNdgLkY4e1ZUcxSzfYUKbwM5q0pG5lNePiwOv
         7FXxll2wYUEI85aVEsP19np7Ju9bEl8kDfsr25mfOtrQe07owDGhAhZzToqNsjeA/IPH
         E+9IHrMS1E0RR1+reFfHNJI5ouyJ2XoNtLzW9AM3mUdmwZItucn/6F40ftKaCGJEwq2c
         uQOFRr7oRd61zssn2NtqMyTC3iNCwKJ7UXnmUrPPz521WtPzXyoeZj+nlHxs99HDqXOZ
         4nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a5D+ny1Y0c3O7KxzHuyI+M5mGXvaRgQ84CvvtncVlG0=;
        b=oCXKLl8ilqZPQLsDqLBBBXNJNnpI9lwADFC0+FjYZDUUpxRm5G3b7Ib/mudq/EiiKw
         lw/FkGCEQfVUsuGS3NfV+Xwokwq/4D3EP5HJa2SrV7OUPowM4UnmBGAWhR0BXrMx63N7
         cw/tsO0BLm1qEuDMwARsg/PXR+wofm4PHnM2D4hRK85dW/RlBZfUUn8OJsZ8PCQ/HBm6
         ZYIDKtKiPkLu5vdR/eOsc9V/sT89RYGtNdf0nUk7G7ixJwI35CxQgW51PDuXYhAqP/dv
         G5NdwIZ0BGX7wsZodgEJCs55zj7knj46+3bSGIxXZG5ucUEszWeDaX96cEMGqOET+021
         +ogg==
X-Gm-Message-State: AOAM533iDgwgrz/FMtjLLU37IoaXG+jMaKAXLFaccbgOqDsIAUT3pYoE
        g0ZlUDZtHVlvYihsApSYOiaY6w==
X-Google-Smtp-Source: ABdhPJyK8z8cdDdyBhx0CBSqDGBDOEf/ee2crujfR5xEIC5Ea+opK/+E62HCRvXJLb044uPARRa9xQ==
X-Received: by 2002:a17:902:8d97:b029:113:d891:2ea0 with SMTP id v23-20020a1709028d97b0290113d8912ea0mr2678159plo.61.1623902343697;
        Wed, 16 Jun 2021 20:59:03 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id j10sm3388366pjb.36.2021.06.16.20.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 20:59:03 -0700 (PDT)
Date:   Thu, 17 Jun 2021 09:29:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20210617035901.kfzps6kg2emthjf4@vireshk-i7>
References: <20210616114934.n3grzuh6c64wlaj6@vireshk-i7>
 <5cffb354-0d00-5ace-260d-61ac0c4c7491@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cffb354-0d00-5ace-260d-61ac0c4c7491@metux.net>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16-06-21, 17:04, Enrico Weigelt, metux IT consult wrote:
> Half correct: I sent it to the list, but this wasn't tex'ified yet.
> 
> When we had an email conversation about this, it was about submitting
> the existing spec in a formal correct way. Don't get me wrong: I
> apreciate that somebody's doing the beaurocratic work. But still have
> no idea why you changed it completely, so there's quite nothing left
> but the name and that it somehow does gpio via virtio.

> The one I've resent (now texified) a few days ago. It had been submitted
> in ascii form last year. The answer from virtio TC folks whas that there
> are some formal steps to be done and it needs to be patched int their
> tex document.

Okay, we figured out now that you _haven't_ subscribed to virtio lists
and so your stuff never landed in anyone's inbox. But you did send
something and didn't completely went away.

Since you started this all and still want to do it, I will take my
patches back and let you finish with what you started. I will help
review them.

Please start with specification first, and resend them as soon as
possible. So we can start with reviews there.

Also please cc relevant people directly, like GPIO maintainers in
kernel and few more from CC list of this email, as most of these
people aren't subscribed to virtio lists, they will never get your
patches otherwise. Lets get over this once and for all.

> You sound like a politician that tries to push an hidden agenda,
> made by some secret interest group in the back room, against the
> people - like "resistance is futile".

:)

-- 
viresh
