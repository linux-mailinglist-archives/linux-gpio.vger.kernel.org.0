Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F13926C121
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 11:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgIPJwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 05:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgIPJwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2020 05:52:07 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5BD5C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 02:52:06 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id o6so6136951ota.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2020 02:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=pMCD9Om2Lu/IPQJBEzW7U6KD68JZvzA7boimU9FhmUw=;
        b=FhTqoxUVLuqBARn9/9QJyyqR6Jqftf/JRCuDSelNC/4eD4/DcNAL+5p2rdObBI5fO+
         YW9ekTWj8DWc99GODhGwK/U96pA5Vuchkh/gpJx353lG8GO5NAzBINn78YLCc6fmHsu2
         KIvV3frdPWHSOBHBZVKbtlAdXcQzCUPwydXRi72HHbqL/IkB+CYn9f3bDi2//3SyjIjs
         E3NcrU91JESJ5mwEyy1MyVd/fMoazjpq+fhzOKpixIGssvOre+WaU1wfrT6JnpmqiRAY
         ulikElz5g2UetWE6FqLA/JnWmjvJQURtIbfvHx+dcPP5GOlidWenjHnPBXHNu6uqEnOc
         uijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pMCD9Om2Lu/IPQJBEzW7U6KD68JZvzA7boimU9FhmUw=;
        b=HhVa1nl+9XC9vXy6+BLnkoQLts9BXuLhi7DSgpDRdD4jBWxIQSa5DU1tqUDyQiTvDi
         UYMVThcCOipa35XoST/sUu58+i9E9As+OI/ru4+CpADpG7NWHdP8/SX69X7PlFnndhEq
         OSqawxmN6ASDjnNv85/AHVqDm1/DSIYfo16i690AuAEKsuSfDi5Axmd0c/9a5EsMMerL
         tNn95/w7O+D4yyUnC+xY8TMpNC7y948xfNK1NpOi2DCniinp+cm/i/4foFYVlQVRqlyh
         JCv9+jURL3umczyDu7Gqi3ZzzlyZvqfal5F5EUOuWw7SCam52uSmuLk8GzK2qphzqZhZ
         KS2w==
X-Gm-Message-State: AOAM530nbadm4CmqKZ0tUSVJgmT7aOzaNFSmoyCOrvTKGgcjUVD0IIIJ
        tcVJLLjCvFPFi0JetyWA5bqH4pUYBArWBU1XkjcVtJWhFvfQC2Qh
X-Google-Smtp-Source: ABdhPJyl9kN7/drOV2I7yMLM5tTyW0OJHBu91zLvA7FXqrp/xEir04I/2KrD9Qk7FVy9e1jNXywE2BgpB0VMacHzvk0=
X-Received: by 2002:a05:6830:2302:: with SMTP id u2mr15017631ote.168.1600249925958;
 Wed, 16 Sep 2020 02:52:05 -0700 (PDT)
MIME-Version: 1.0
From:   Drew Fustini <drew@beagleboard.org>
Date:   Wed, 16 Sep 2020 11:51:55 +0200
Message-ID: <CAPgEAj5BS7zRyriOrX8gCxejEqZZ4M8d7_+W95e0V2UML8ZEQw@mail.gmail.com>
Subject: Linaro Connect: gpio and pinctrl session
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The virtual Linaro Connect is happening next week and it is free to
register [1].  There will be a "Birds-of-a-Feather" discussion session
on gpio and pinctrl [2] on next Wednesday, September 23rd, at 12:15
UTC.  It would be great for anyone interested to join.

thanks,
drew

[1] https://connect.linaro.org/
[2] https://lvc20.sched.com/event/dU84/lvc20-218-gpio-and-pinctrl
