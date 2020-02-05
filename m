Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB546153629
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2020 18:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBERRf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Feb 2020 12:17:35 -0500
Received: from mail-lf1-f53.google.com ([209.85.167.53]:46305 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbgBERRf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2020 12:17:35 -0500
Received: by mail-lf1-f53.google.com with SMTP id z26so2014328lfg.13
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2020 09:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=/Ch6Amfqr8Y66QjHmWkb6X2/kunn+W7BEYLKrCbzB+Y=;
        b=ALymygHwQpYhYRANxh2/9c6w6Qk0Abd0mmrllrZy5uR/qZQ/vthqXc13z+bTSRgbT4
         /o9RaHaFEtW0Z3uk5PwBV7F272A/jGbyNBd0xa+yH28Pa4BAwWKYxdFYLh7yrETeu0L7
         q35WF46V4ZHg5pwaRAzgiWEXgiht+LhgIwY8rNIr9gGLHPTLx4oLN23uRKb2jiE152VU
         se59T8Bx90eV9ZiClsVqBxa8N6jc3JrjZHxL1K6/Nyk1pzw7riISxLpwWpn+WAOe6MmU
         wgU5nfGcTDAYsWBAn9tkurgI7oNcvzgoEblQU3vCeIrwEbuWgPhMvz1f3Hyg5RvT3+I0
         sfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/Ch6Amfqr8Y66QjHmWkb6X2/kunn+W7BEYLKrCbzB+Y=;
        b=NzUz0wNPnQzWjYLK6R3Zp21FoMKhhtZBYtUzJgWBv3+NakfT5mHC0kiPGzjpGyz/Ex
         T6IJovd6FBl2zloH0olmcLspVjzGYxhdFxcWf6nPtMF1aiX8CTSPEnTV5FwTA1e4J4sw
         oxZOlXkjp3sgKD74EhE6BAXat3cxdEI1CpRmNkdcPNtpV/J5L6YLU88YtGTIljkSAKmM
         5m9D/w2AMbKPcWHMs6KieQZjAphMSjyS6eK4dAquDSx4D+S4tYi+pDHPCMR3bLEKn6i7
         RdBuWFQVdEE9YlPKMd20cvo0Xy5CfkXggs12KSR9Ht60DjiJer7gd1fgb0IK/V7bnVXE
         oc7A==
X-Gm-Message-State: APjAAAUlKe35s8cTc1LDMJk2WHjedg3aFLpkQrs9QfpD6YpwAUHmD1e7
        IzQ4YCPTmiB8/+Oo5RNsNnhs1StGMyGbQtwm9LV/jZXe9EK9eg==
X-Google-Smtp-Source: APXvYqzoKzZy4/7kCftLs5xN6KcESwRXOuV01KQ0KnlHqz65zFRjIEQgDOy1f+WkT923UkyvE+DNma4wPznm7tGT1RM=
X-Received: by 2002:a19:c1c9:: with SMTP id r192mr18583431lff.28.1580923053308;
 Wed, 05 Feb 2020 09:17:33 -0800 (PST)
MIME-Version: 1.0
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Wed, 5 Feb 2020 18:17:35 +0100
Message-ID: <CAEf4M_BdAEV+6bhezuHF32MDrddkN+QuBO_tteHRzZiBD8VFVQ@mail.gmail.com>
Subject: fyi - blog post about new interfaces in Linux 5.5
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "warthog618@gmail.com" <warthog618@gmail.com>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I came across this today and thought that it was a nice write up of
the new gpiolib interfaces for userspace that Kent and Bartosz got in
for 5.5:
https://microhobby.com.br/blog/2020/02/02/new-linux-kernel-5-5-new-interfaces-in-gpiolib/

thanks,
drew
