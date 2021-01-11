Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4EC2F0B0E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 03:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbhAKCfN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 10 Jan 2021 21:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbhAKCfN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Jan 2021 21:35:13 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD06FC061786;
        Sun, 10 Jan 2021 18:34:32 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id z20so10403061qtq.3;
        Sun, 10 Jan 2021 18:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Wgjy9xILhvZ1iGkvuXUiXzK4vCg0w/7IKELJ+lduWIc=;
        b=QYmUTLCYB0E/lwQuvxm9Ux4O3HkdgZVLu4O56Q//wzRVqfwDksRwGrJZnedcMJtVIb
         VawlEZ1qir++uU0vDYN1RATdk6WyzcBZMURfuj12mZo4S3JQ3MgmpH4iIA+smDEIpHxc
         8qcd/WWVSURL7e6E7UtEL9xnFy+kBA4NBrU+iF7fhKKrcPX5f6L5IwpguJRo6T4/SMpU
         j1gcZI+pj3unKoP4apxCQQfzM0+j2VORqKcJGXXv+Pgb6gIwpTUEHNTMmdF9SK0qAuM3
         RhQcwScHbY7kl/aGMo0hxmdG8XGca8jDqq7jKPUi7J1sJjVi8/+yjjwgCzHc0cypzH/v
         yV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Wgjy9xILhvZ1iGkvuXUiXzK4vCg0w/7IKELJ+lduWIc=;
        b=VkrWUv3+M5eDtjO7FJosYTx1NK8a5d8LlJ34invitTr6Rc7EpaNu75tKroUwNvfpk5
         /Swy3ipLbwp1EK9f3rVMVVmaUzKccUjDESwcLd7otY9iETBXEuLHjguvvesqPsItqXb6
         8UsAKaEhHOytlFIwI52VZgqiFki/l/b/eZOyMQkrVSB8TPtduca6HFvUaxjAJ36Werx2
         jKQm8u7cgRstxRpA4ZXCbZtxE2lR+7FZlrXFXY+n8/e26qq2UMa1AIlUNhGA+1JSzC2N
         dvIlHitUMFFLPkty0n58s7gMboY6bJoCtPiYFl8v+KGlLb9UmZPvF59IYJuDHgNqHzoI
         AYNQ==
X-Gm-Message-State: AOAM533ZY/wsjq0yPXKZwqOVfb6uN3d08syByQUQrt35IGUp3VqxXsV4
        QhoeVXhB+VgVEcuxQkJvnsM/tOTTmpk=
X-Google-Smtp-Source: ABdhPJxKKb4fY63zjcoGGFJFqxO0kzVbWfdFvLQ7FkjBLGoAd/Wmu0WylPj7mcZlThsQ6JbhgHFv6Q==
X-Received: by 2002:ac8:5acb:: with SMTP id d11mr13776541qtd.269.1610332472005;
        Sun, 10 Jan 2021 18:34:32 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net. [108.51.35.162])
        by smtp.googlemail.com with ESMTPSA id g3sm3179121qtc.3.2021.01.10.18.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jan 2021 18:34:31 -0800 (PST)
Subject: Re: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
To:     Damien Le Moal <Damien.LeMoal@wdc.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>
Cc:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
References: <mhng-a7443f7f-42ff-4835-9b25-be8f91884e04@palmerdabbelt-glaptop>
 <7e0b4efd305d2c5deeff7dd263234a32aa093f58.camel@wdc.com>
From:   Sean Anderson <seanga2@gmail.com>
Message-ID: <03fb06e8-d587-3cf2-9b66-bf31449e7b8a@gmail.com>
Date:   Sun, 10 Jan 2021 21:34:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7e0b4efd305d2c5deeff7dd263234a32aa093f58.camel@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/10/21 8:56 PM, Damien Le Moal wrote:
> On Sat, 2021-01-09 at 09:32 -0800, Palmer Dabbelt wrote:
>> On Sun, 13 Dec 2020 05:50:33 PST (-0800), Damien Le Moal wrote:
>>> This series of patches improves support for boards based on the Canaan
>>> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
>>> already included in the kernel. These patches complete it, enabling
>>> support for most peripherals present on the SoC as well as introducing
>>> device trees for the various K210 boards available on the market today
>>> from SiPeed and Kendryte.
>>
>> Putting everything together like this makes it overly difficult to get things
>> merged: there's some actual fixes, some new arch/riscv stuff, and a handful of
>> drivers.  I know we've been kind of mixing up the SiFive and RISC-V trees, but
>> that's largely because things have been pretty quiet and it's the same people
>> working on everything.  That'll probably change at some point, but it doesn't
>> mean we can just start mixing up everything in here -- even for the SiFive
>> stuff, we usulaly try to do it in the relevant subsystem tree.
> 
> I know that, but for some drivers (e.g. clock), there is overlap that would
> prevent compiling if not all patches go to the same tree. And for people to
> test, if not all drivers are in the same tree, nothing will work (e.g. without
> the pinctrl driver, nothing device will work, even booting will fail). That is
> why I kept sending everything together.
> 
> With what you applied, only the clock driver and the fpioa driver do not really
> belong to the riscv tree. But since you queued the dt-bindings doc patches
> which add the headers for these drivers, it may be necessary to keep them in
> the riscv tree to avoid compilation failures.
> 
> Stephen, Linus, is that OK ?
> 
>>> Pathes 1 to 4 are various fixes for riscv arch code and riscv
>>> dependent devices. Of note here is patch 3 which fix system calls
>>> execution in the no MMU case, and patch 4 which simplifies DTB builtin
>>> handling.
>>
>> The first three are on fixes, but the fourth isn't a fix: it's a fairly
>> significant change to how portable our kernels can be.  The old scheme allows
>> vendors the option of building systems with M-mode compatibility, this new one
>> doesn't.  That said, I don't think anyone is actually going to build systems
>> this way -- we really should have had some sort of mboardid, but that was shot
>> down in favor of some sort of platform thing and it's unlikely we get that far
>> over there.
>>
>> I'm not really sure I'm ready to throw in the towel on binary compatibility
>> between vendors yet, at least in general.  In this specific case it seems fine,
>> though -- accross the board we're just spending way too much time worrying
>> about the small things while we have way bigger problems to deal with.
>> Obviously it would be better if we had some scheme to handle this here, but I'd
>> much rather focus on the basics.
>>
>> I still hope we get to the point where we can have binary compatibility between
>> systems from various vendors, while still having reasonably useful systems.
>> Unfortunately we're quite far away from anything like that, so I'm fine taking
>> this sort of thing as that's as good as we can do for the forseeable future.
> 
> Yes, I agree that working on improving binary portability is very important.
> However, I am not convinced at all that trying to do so using a device-tree
> based environment is viable, or even desired. I think that true portability can
> only be achieved using something like ACPI or equivalent allowing run-time
> device discovery. But that is a discussion for another thread.
> 
>> This is on for-next.
> 
> Thanks.
> 
>>> The following patches 7 to 11 document device tree bindings for the SoC
>>> drivers. The implementation of these drivers is provided in patches 12,
>>> 13 and 14, respectively implementing the SoC clock driver, reset
>>> controller and SOC pin function control.
>>
>> The numbering is off a bit here.  The clock stuff has gone in through that tree
>> and I'm fine  taking the reset controller as that's been reviewed, but I don't
>> see any review on the pinctl driver so I haven't taken that yet.
>>
>> I'm happy to re-send that patch (likely with a more appropriate subject line,
>> as it's a pinctl driver not a riscv patch).
> 
> I rebased the series on the riscv tree fixes+for-next branches and changed the
> subject line of these 2 patches. I am testing that now and will resend soon.
> But so far so good. All is working fine.
> 
>>> Patches 15 to 20 update the existing K210 device tree and add new
>>> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
>>> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
>>> board from Canaan.
>>
>> There are tons of checkpatch warnings in these, mostly related to compat
>> strings that don't have binding definitions.  It looks like there's just a lot
>> of stuff in there that doesn't have any support on the Linux side, my guess
>> would be that the best thing to do is to drop those until they're defined.
> 
> Yes, I am aware of these warnings. Despite that, I kept the undocumented and
> unsupported DT nodes as having the complete device-trees (soc k210.dtsi part
> and boards dts) constitute the best documentation ever for the SoC and the
> boards. Most of this work come from Sean (with some corrections from me) and
> extracted all this information from the almost non-existent documentation
> (basically only board layout doc is available) using mostly only the Kendryte
> SDK is really hard. So despite the warning, I would really prefer that we keep
> the DTs as complete as they are now. This would also allow us to point to
> specific nodes that need support for new developers that want to get involved
> with riscv (mentoring program of the foundation). These boards being extremely
> cheap are the perfect platform for students and hobbyist to get involved.
> 
> So unless you insist, I am going to resend the DTs as-is.

Just a note, everything which isn't supported has been left disabled
(usually implicitly). It could be possible to remove unsupported nodes,
but I would like to keep the Linux and U-Boot device trees in-sync.

--Sean

> 
>>
>>> Finally the last two patches updates the k210 nommu defconfig to include
>>> the newly implemented drivers and provide a new default configuration
>>> file enabling SD card support.
>>
>> I'm also going to just leave these out for now, until we sort out the above
>> issues.  Let me know if you're going to send another patch set, or
> 
> Thanks.
> 

