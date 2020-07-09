Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A925C219AD0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 10:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgGIIag (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 04:30:36 -0400
Received: from mail-ej1-f43.google.com ([209.85.218.43]:35648 "EHLO
        mail-ej1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgGIIag (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 04:30:36 -0400
Received: by mail-ej1-f43.google.com with SMTP id rk21so1406492ejb.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 01:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cCsM57dwjKJWJh2ZkfIyeUo+apxAWL93z8FtkOpJ8us=;
        b=IIwrx42+1HL+No/trcilLSpfb5otjoCyrKY3NVz46pWYnmWzu5hH+FPgpxCVoDloE1
         ELgth8+yzShVi87rQuAcImu4CCC7LGW5fvinVgjeRFv74gKxU5ZRoa5zzbtZWJS4vKTp
         9J7eEGhJgiwnBIPeFbhbE2jBrQpO2jqjVJ8O5kFrw0Qsa2alTZNZQVlgjWldBL+gHdjN
         H/gn8KinMrAb2+yCdQYk83NALbi+9rdBUAsBj6vX7vG1uraewD077p2OynthQau7Tt+k
         76MT6/38PL/eHEvW3fJFhuTKhLUorFVMcy3ehvHyGEV6PAZ3c+7EuNEOL4q/61cdLiyu
         FOow==
X-Gm-Message-State: AOAM533lJdLvInkAZkgcei3eHs03Vb95M8wo0Tr1bcdvtm/tsULNNFR8
        Ci67KrhjT9ESFkHlMOGTi1c=
X-Google-Smtp-Source: ABdhPJzBoZn5EZdPW2uMevXOSMNXatlw2JPmvf9ynxaJRyqN6xbAUmLemEAXLsiyoABoiqMNZK2vog==
X-Received: by 2002:a17:906:4f82:: with SMTP id o2mr47998523eju.424.1594283434318;
        Thu, 09 Jul 2020 01:30:34 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with ESMTPSA id gr15sm1346778ejb.84.2020.07.09.01.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 01:30:33 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
 <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
 <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com>
 <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
 <09661b70-0a19-e70a-1985-4da6024ec291@redhat.com>
 <29d9d787-bec2-7c41-30d4-d03c4cf75cdc@kernel.org>
 <12101845-4a03-802b-fcab-7fc78fed0be5@redhat.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <071f2816-0cb6-b725-532b-08fc56c1ad1e@kernel.org>
Date:   Thu, 9 Jul 2020 10:30:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <12101845-4a03-802b-fcab-7fc78fed0be5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 08. 07. 20, 13:47, Hans de Goede wrote:
>> Unfortunately, there is nothing like that. It's discussed on the net,
>> that these UMAXes have only 32bit EFI.
> 
> Which is not a problem by itself, mixed-mode support works well,
> in Fedora we even support it out of the box.
> 
> What is a problem is the OSID thing. So one last silly idea,
> can you try on your EFI system partition, creating a dir called:
> 
> EFI/Microsoft/Boot
> 
> So the Linux path of that likely is:
> 
> /boot/efi/EFI/Microsoft/Boot
> 
> And then copy your grub.efi to:
> 
> /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi
> 
> And then with efibootmgr create an entry
> titled Windows pointing to that and try booting
> that boot entry?

Ugh, there is indeed some magic, but it doesn't help.

I created that entry and dubbed it "opensuse_MS2". BIOS renamed it to
"Windows Boot Manager". But still
/sys/bus/acpi/devices/INTCFD9:00/status shows 15 and storms.

I created also EFI/Boot/bootia32.efi. Now BIOS thinks I am android! I.e.
wifi disappeared, the boot option in BIOS says "Android legacy". And it
always switches "Windows 8.x" to "Android legacy". If I delete
EFI/Boot/bootia32.efi (deleting or adding an entry to efibootmgr makes
no difference, the presence of the file matters), I can set "Windows
8.x" and it persists booting, but still storms and things (but wifi is
back).

Any other idea what file/volume I should create in EFI fs?

Note that there is also this entry in bootmgr:
Boot0000* Windows Recovery
FvVol(a881d567-6cb0-4eee-8435-2e72d33e45b5)/FvFile(c57ad6b7-0515-40a8-9d21-551652854e37)RC.W..

This volume definitely no longer exists, at least I believe so. Should I
create such (how?), so that BIOS really believes Win is installed?

thanks,
-- 
js
