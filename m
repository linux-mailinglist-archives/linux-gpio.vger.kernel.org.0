Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF1B12031B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 12:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfLPK7S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 05:59:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51715 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727466AbfLPK7R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 05:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576493956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hQ6sYFdb7LHBsbEybHzcurKWWaevQ2cyS6out70xyhQ=;
        b=aP7u+RyU3KNTdtzRSlRCrySPDSiZivgEeJcHGjYYrLFa4zvEgf+1PY6yqUbM0ouOXqvANf
        OeIrOTO2sCIkFsLbjdKdbUs7rf7QXEZLTJDouY/hFTk3xCALnmFdNzBjtOorkZtVxJPKDD
        /+bZi9TbTMvggSjD7iNJxBJPFSVDH/Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-xUjZaD5DNaCAAvEVLgLarw-1; Mon, 16 Dec 2019 05:59:13 -0500
X-MC-Unique: xUjZaD5DNaCAAvEVLgLarw-1
Received: by mail-wr1-f71.google.com with SMTP id z10so457747wrt.21
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 02:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hQ6sYFdb7LHBsbEybHzcurKWWaevQ2cyS6out70xyhQ=;
        b=c73BzERniaeJSxweM0sj/m8Y1kxd9s5UYd1jHr7R/GDkH89HHl3n7eyr5I0zQCtYte
         2TrOvM4DuFeRGNDqB5g8KcmhrUPEE/eYPs1gTJI0l2lbQMJK3dqlF+9Oa8e1AYQnsL1t
         cSOUGLL5p7etJVgbIP0cVwyob9iutCCW5Zd2s6+7Sl6AWH5+LTxW87bzl+ECMUxPH2yB
         EtHNg41jpxvUvEXp0e+CKlftBYc/LcvgJzTRJxWHPBKPKpgFyschRjPQnK/aB618iAKP
         CoBjplbDQsp8/3yF8u2iipvVQwzVOlqb8mGjW2E6ZNXNNOQ1GxSBJRAOXMpf3T1BrKdx
         u33Q==
X-Gm-Message-State: APjAAAUePu47xTHWUyUVx3iSq43fy0w3fprUCk8xG5HWM7pir0YgIO9g
        /wjCeQzQVkfzuGC5J3YYUPH2nmSIOTWGxCJ1mS520sdMQZJbpWDoV3XxBflc48BQPbmCtyWuzF9
        WM2QyLbcySgO4TQb/rLffdQ==
X-Received: by 2002:adf:d848:: with SMTP id k8mr28536782wrl.328.1576493951606;
        Mon, 16 Dec 2019 02:59:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwuvaGOybV0XNDKQ0IqtqC93KS7+4qbR1CruhBbHrdFS8xkO4lkM5kRrehoFB3fnxoPD5bNoQ==
X-Received: by 2002:adf:d848:: with SMTP id k8mr28536750wrl.328.1576493951322;
        Mon, 16 Dec 2019 02:59:11 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id s19sm19808552wmj.33.2019.12.16.02.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 02:59:10 -0800 (PST)
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <CACRpkdarJ5chDfgc5F=ntzG1pw7kchtzp0Upp+OH9CH6WLnvXw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2a356fad-a473-3e37-4a7b-731594524862@redhat.com>
Date:   Mon, 16 Dec 2019 11:59:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdarJ5chDfgc5F=ntzG1pw7kchtzp0Upp+OH9CH6WLnvXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 16-12-2019 11:26, Linus Walleij wrote:
> On Sun, Dec 15, 2019 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Linus, this series starts with the already discussed pinctrl change to
>> export the function to unregister a pinctrl-map. We can either merge this
>> through drm-intel, or you could pick it up and then provide an immutable
>> branch with it for merging into drm-intel-next. Which option do you prefer?
> 
> I have created an immutable branch with these changes and pulled it
> to my "devel" branch for v5.6:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-unreg-mappings
> 
> Please pull this in and put the other patches on top of that.

Great, thank you.

Jani, a question about how I am supposed to push this (when this has been
also reviewed by some i915 devs and passes CI), can I just do:

dim backmerge drm-intel-next-queued linux-pinctrl/ib-pinctrl-unreg-mappings
cat other-patches | dim apply-branch drm-intel-next-queued
dim push-branch drm-intel-next-queued

Or I guess that dim backmerge is reserved for other drm branches only and I
should do:

dim checkout drm-intel-next-queued
git merge linux-pinctrl/ib-pinctrl-unreg-mappings
cat other-patches | dim apply-branch drm-intel-next-queued
dim push-branch drm-intel-next-queued

Or should I leave merging linux-pinctrl/ib-pinctrl-unreg-mappings into
drm-intel-next-queued up to you?

> I had a bit of mess in my subsystems last kernel cycle so I
> want to avoid that by strictly including all larger commits
> in my trees.

I understand.

Regards,

Hans

