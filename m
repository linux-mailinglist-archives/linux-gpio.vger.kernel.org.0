Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925E03F2544
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Aug 2021 05:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237933AbhHTD01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Aug 2021 23:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237934AbhHTD00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Aug 2021 23:26:26 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0248FC061575
        for <linux-gpio@vger.kernel.org>; Thu, 19 Aug 2021 20:25:49 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id v2so8104359ilg.12
        for <linux-gpio@vger.kernel.org>; Thu, 19 Aug 2021 20:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=x0vBVfs0aObTvBgrsn3BERoDEnWTvuRAY6vysnNfl/8=;
        b=F4/hOE0x+XrUxDWjAJwVps8owXigBlanJwH19baFI8hBN8fRggKxGFzk6+FS5UJjqK
         FRQw1wTayriMXbnu0UGkDZ/OKcUkLXbO4HEaBvQTc4bV0CB3iANlSCL6VT0WTNkvjSrc
         DEwRXk0OKYYSI2pXnddX6mIOl/CaWr0GLe45JHv562324ellh52NxEdMDoxPRBlBnSGM
         71sX5I31vYb6O1HAZtaPMRQK1ghs6sTlZhXUP4j0O+RVHHGi4gPKmmAULmyOzmXZ/lmW
         Bp8kgd2KOds0vpPj8DwB6oKbQfyek+2NQjsTq/3IUFBOXZtNdKZ/dcqFt3FuWk+0WMbA
         3B0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=x0vBVfs0aObTvBgrsn3BERoDEnWTvuRAY6vysnNfl/8=;
        b=WPaczjRd6hMnw16N+4XZku8kzJuBTu2VmWFKz8n7+tHtTpyOC6r64T6+6nBb0SCUJY
         HpSb+f8m0BAtpCsfpZjD91WB4HNeMdmzMpVLxkmS1HpqzNdPcqotCauCSzRU59vNb3sJ
         R9OCNcNOeA9mGl9VK9J8aZVMBNAGopWjbDUjKDRSy0MwaE+rwb7RnPF8Z+4RHvRlPnCM
         6umMnGU8+vHp3+5eAuNZVLeNJmsugPOSY3m4w2wADyPkO0VqSXLg5yFt071lTK6QF9cW
         5z6IrKr4Ck5+GMH0ifBEXdWCPNtJnsXCxcFRtNb3CV33uNzIIWWf1Aj6iRyjxJ5AdE/q
         iA4w==
X-Gm-Message-State: AOAM530AIajMWEPEe8Q4QdYUQxaIEQIuD9GDoyo11rZk5Bju6TnRQEYS
        uz+nmralIOaQ02Ykcfbs5bzpwqxnRtG5MuCvrQFBCud4kkCX4w==
X-Google-Smtp-Source: ABdhPJznnIFUBGnlz+tzZQNWQem8ZKRPOQo5NJaVUO52f9tCio+DXUP+VzXkC/aZZ6TFNqewyqZOK9qdN6EknIgUSrI=
X-Received: by 2002:a05:6e02:1a4f:: with SMTP id u15mr12129726ilv.251.1629429947382;
 Thu, 19 Aug 2021 20:25:47 -0700 (PDT)
MIME-Version: 1.0
From:   Riz <mdrizwan827@gmail.com>
Date:   Fri, 20 Aug 2021 08:55:36 +0530
Message-ID: <CA+FSg4rJcDPhPoBbEYjsq_UOysLUdp6YnBh+3XeHL7UkH2cfdA@mail.gmail.com>
Subject: Regarding export of GPIOs
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,
I have some basic questions around the exporting of a GPIO.

1. Regarding gpio-hog mechanism:
The gpio-hog mechanism would help us to initialise a GPIO to either
high/low & in/out during bootup.
This is fine.

So my question is, if we hog a GPIO, does it also gets exported to the
userspace by default?


2. With the older sysfs interface, we would be using "echo x >
/sys/class/gpio/export" to export the gpiox to userspace.

I wanted to know what would be the right way to do this with the newer
interface?

3. To check if a GPIO is being exported or not, we would see the
/sys/class/gpio with the sysfs interface.

With the newer character device interface, what would be the right way
to check what GPIOs are exported to userspace?

Looking forward to hearing from you

Regards,
Rizwan
