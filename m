Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A113F193AD6
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2020 09:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgCZIai (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Mar 2020 04:30:38 -0400
Received: from mail-pj1-f52.google.com ([209.85.216.52]:38309 "EHLO
        mail-pj1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgCZIah (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2020 04:30:37 -0400
Received: by mail-pj1-f52.google.com with SMTP id m15so2107065pje.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2020 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UsW4z0LvKS+6JnS41VxHiiYNLml8WrAaqAaW7l8sQpA=;
        b=AE3jfFlkNek09QVDbMXOYUdtTzjajhWM8TKeBwk6BnHK/4MqoN/GVeAeRoBF6GiSQF
         tD9gQsnYhvKi1aeJ2v7kidy/DxkH8SOXM7GIgBNMHt6IhPgLiNTJPvblNfMnADkS8fKk
         l6jPJH79dfz+niCD/xqwSey955mzIC09ESPgtR54jD4zuxgz6Aa7Ch33r6197Sh7XFC5
         DS0PGjWEtlmzTo2tV5urpk56hEGeoz4w/1b+U01SCmO3u5P2xRkiVMBd1suf4a/H+lLI
         4I/P1DZ2RHryseAia3Jyv5DY4U8NrYQPO3WMB/xYengMZjcXtH2dI4T4yqQpAuRAwqC8
         mkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UsW4z0LvKS+6JnS41VxHiiYNLml8WrAaqAaW7l8sQpA=;
        b=XbG2ZFD/Z36+NJIJPbwr5eRD/g+sTrIHvUJrrDGBc7oRYzKw/hyqFjYHEXZtIH3HWq
         y9FMl9EJ6B7/oB9/QPhVN7/acndWXye3uFIxAMI4DkWLr0v9SwuWcLCw+FCaBwE2lBGf
         GXSsGbHhnFQNBo+Ls3h9UJs5AueQDASQ/IakmV9vpz2iROc/DiLVgSO6KnpXwVD9qERl
         YJJf1Uhbdxp2ZZGbcMH7C/2auoL2WCRqdlqhaArojRRyXMd18OcH/Dh6l/Bu12uh1U+V
         yLJgH5gd5+boq+TfJG4/qW702/UHGjtFggWF2HTOZJJccExpBeZIr6jui59/p6ZqX8xn
         Ylbg==
X-Gm-Message-State: ANhLgQ2LwzRqKT35wIVBoU3uvltO2zXnl/FvJomGP7r0v7OMqci+Dj7Q
        Eol35wZMbumnqBsol+NPu+V99PmhG6g=
X-Google-Smtp-Source: ADFU+vthmm809q7bO+P5xfO28C1V0eqXHN2qQpRFRccQBgvUPHSaaM72h/zc2AppIvUS3iMcXmgf2A==
X-Received: by 2002:a17:902:ba93:: with SMTP id k19mr6978930pls.73.1585211434700;
        Thu, 26 Mar 2020 01:30:34 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f45sm1069799pjg.29.2020.03.26.01.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:30:33 -0700 (PDT)
Message-ID: <5e7c6829.1c69fb81.8b6e8.4982@mx.google.com>
Date:   Thu, 26 Mar 2020 01:30:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.6-3-48-g7d52bac0fadc
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (gpio-v5.6-3-48-g7d52bac0fadc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (gpio-v5.6-3-48-g7d52ba=
c0fadc)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.6-3-48-g7d52bac0fadc/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.6-3-48-g7d52bac0fadc
Git Commit: 7d52bac0fadc072655373772f4ee9455039858e4
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

---
For more info write to <info@kernelci.org>
