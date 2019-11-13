Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D71DFAFCE
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 12:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfKMLhY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 06:37:24 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:40253 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfKMLhY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 06:37:24 -0500
Received: by mail-wr1-f54.google.com with SMTP id i10so1955782wrs.7
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 03:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wiRr22PQh2wdOHIGYx3yK5aBXVy8Bnejs0OxjicfcWM=;
        b=gTpzP607RGNDA9tuDazby2M5LGVI+XKMVg6Sd0McZNbWxU81vHAskfcdAoeo7wFZeI
         ADji4+qI69K0s+HY71bcAV6oN9mB09/Jh+He6+l/nXG2tQhgJk0/t6YeSO+2Z/d8Ne8+
         5+1rXCRtHcKqXlpjdGa27aJPdmAaoc8GfDHbcVMqZ5q1zY8zk57zgBQV3pQg+dePgZ3i
         C/R0j/363ywrr57bBlw7azW/IbBjhm6jCRxsuJk+tkz91WQds0lTjE8H43WkSdRgBOXQ
         4UDYR7dLxYj7Z/TyrIdQBlxhqYksR0ewWIQ/a9YGnBEocEGq/tIou8KA4C/FHjHOAM42
         FShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wiRr22PQh2wdOHIGYx3yK5aBXVy8Bnejs0OxjicfcWM=;
        b=BCaZ4mDeP2fKUpEr4yXbL4+1GWBmPXIEV70OR7p6hpAT4IiVFB/xOn9JPp8u97wkPb
         sX9Grpo2A1T0wDLreOUaXjG1PdUOoVLYJnSob3ncv/WCVf+jN/pb9uTd03awqeg+UoXd
         KpmMlf8TKucUth3X4HMmPjZ+0PwUF+7dc0lEpqmjmu5+25xPQtTtqxrz496eXOJ2Yk4Y
         a1JUy2XdIhoR88FptLj6qi9kbGMn74M8eAew0YRJCEpAnlPaKrHuu9uiGWNGxSBthpH8
         /6AJHsLO+fJp++nMwjJ3MxXp7dDXhYUCsFAJOOvrdxph4/8efnAoC+/kiFI0RQLNyEt/
         SIYw==
X-Gm-Message-State: APjAAAXZ69smXcnx1XeAUy8WeB85eNZ4vKFs/aj/aL4GWVOw161STpeC
        7WJvflWIejXpVgBzIYBrQuWOrdk7RW3PIQ==
X-Google-Smtp-Source: APXvYqx0v6MLdXwfvjWCYtjbhl7XK5iJedpHaLNiNr7R8DR3U6fZ+z6qT2oAQYi7sXastJtcjSkeEQ==
X-Received: by 2002:adf:f005:: with SMTP id j5mr2288059wro.295.1573645041800;
        Wed, 13 Nov 2019 03:37:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y6sm2563383wrw.6.2019.11.13.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 03:37:21 -0800 (PST)
Message-ID: <5dcbeaf1.1c69fb81.90305.b723@mx.google.com>
Date:   Wed, 13 Nov 2019 03:37:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-39-g61b7805a9b25
Subject: linusw/devel boot: 45 boots: 0 failed,
 45 passed (v5.4-rc6-39-g61b7805a9b25)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 45 boots: 0 failed, 45 passed (v5.4-rc6-39-g61b7805a9b25)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.4-rc6-39-g61b7805a9b25/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-39-g61b7805a9b25/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-39-g61b7805a9b25
Git Commit: 61b7805a9b25bc1a31386c904fb5b03512c801c7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 37 unique boards, 12 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
