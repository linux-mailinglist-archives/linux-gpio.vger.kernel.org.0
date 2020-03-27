Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B79195682
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 12:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgC0Lk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 07:40:59 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:43588 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0Lk7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 07:40:59 -0400
Received: by mail-pf1-f177.google.com with SMTP id f206so4373156pfa.10
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2020 04:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5bx67EEaPxWAxUhgsRXd1h1ZgtnGPKISe+/ClMvozCs=;
        b=eR28qBeEUg9fiJ71dRMtiKN1sFXoJbTsyfG6krr/FOZgFehhOnwWviFawRx1cBmpnl
         niqHW8FTUWdoTp+L/9bP2av6FFfEo91b+lUxvOsSdq5AtBp9eUpI4s/w8dLBCm8Mud5R
         ItmR2En5fT+hhJ91Bm974F6xaSZgTEHgOK2//dO2VpfJtiQstGzSd7ZYAkMQ4OONXi23
         yne/sfwUInENkU6amZS/5r8PiFSnOqmNA3BSXhI9VhcsZvRDntJda3eJcnRn2+WLXYND
         FcAdyeDDK1YlgpoBuvXhHMNr1/Ic+94O+X8HmaKfZWWq+AnD3z1UANvkdb9pKziKqtjR
         RJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5bx67EEaPxWAxUhgsRXd1h1ZgtnGPKISe+/ClMvozCs=;
        b=G/ByDJvfynZQl6SXA05Jlio1MoqmQqQK7zQa/blF37LIZIpC8MUQNaIOFT7SvAvvLe
         L+Tuh/LRq75Ep8vmGD7SRor6c5J/hll7ziHYqYgvCSLh4jUheTjdxqQH2/ub3TDNFrKT
         T+GbUO/0FBg/lh7xMQpvpwbdFNKLeOVpxREUUClL/UqbsLd1xCH5UC6cowZx8MbulNqf
         q4t9/d5DSyDRcnpmZI072PcI4YwKVoADJ1Dn2wWbpMLM1ncJsUhFgJVr+R/pRLkvfsYA
         3+tQ9AIWqR8qeGswrSr0NJMuu6bPqc5rQtBy0hbhkwA6I4BNwWu/QE96CdtlvcD9WoHP
         hWwQ==
X-Gm-Message-State: ANhLgQ1t77FnKPpwdAejo76TCqZe+vjGeZEnCSwwSU+24q6tP2lHsiu4
        tNN40UdkBm/uydmbz0bI+EJxO2MV2VU=
X-Google-Smtp-Source: ADFU+vtg9MX8B5oBmFXgkaq0Pp+YUvsNxicR6/lE64X4gzAJjeAy1+dot+1Cq7biymz0peKxTeDS7Q==
X-Received: by 2002:a63:be0f:: with SMTP id l15mr13332647pgf.451.1585309257729;
        Fri, 27 Mar 2020 04:40:57 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l7sm3836834pff.204.2020.03.27.04.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 04:40:57 -0700 (PDT)
Message-ID: <5e7de649.1c69fb81.e3ff4.e9de@mx.google.com>
Date:   Fri, 27 Mar 2020 04:40:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc1-51-gffa91e7ca142
X-Kernelci-Report-Type: build
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next build: 6 builds: 0 failed,
 6 passed (v5.6-rc1-51-gffa91e7ca142)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed (v5.6-rc1-51-gffa91e7ca=
142)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.6-rc1-51-gffa91e7ca142/

Tree: linusw
Branch: for-next
Git Describe: v5.6-rc1-51-gffa91e7ca142
Git Commit: ffa91e7ca1426a89eec1b3101286d82785760767
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

---
For more info write to <info@kernelci.org>
