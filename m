Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5406D37D4
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 05:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfJKDSz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 23:18:55 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44773 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbfJKDSz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 23:18:55 -0400
Received: by mail-wr1-f65.google.com with SMTP id z9so10118068wrl.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 20:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HDRNcg3GhRX07vlILrmZ38af+B4NvWBaDlZpHjzwSGs=;
        b=AQm+KvrTjxgRdrJ9Ca2S+OcvkWx3b4XEG+sVrQu0UpejbvtkUzN8VJti/wP+3/eOez
         JExCA6oukDcdA+KYU9xrU5OratfHH3bEV8Ub3JlYYdv5Fb+pZfH2TUPXF3PyhEtoLBCA
         FFBwZFnrgiEkyFs5EV8XKYPazJXFRwKZczZk5H1HjoxfoBPj6Qi3jkAvKqRSj1KjBuaM
         Ya/KtigvhxMlAR8N9CYTtvr/4Tor4WXW8IT2af9KKhWU+PAQyBUh++cwQMIbDwJw0GzM
         mUf587aPycbNvWYepoEcggp4yfKRn1KbGn38FaC+w1KL8QmhrR3JbVrq81M6DEttJRi4
         QSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HDRNcg3GhRX07vlILrmZ38af+B4NvWBaDlZpHjzwSGs=;
        b=An4cF00+015GJXc49A6MPF22Zrg43yCaiD/B+9DwKNszsUoxGObWS1fp8Lh9nILahZ
         notfWx3Su5ciU6V3vn6/KNz+g4Y0/E8s/6JogwtKZ5+NUTl1O0EsxriE4YfDIv23R/yZ
         HvKyyf6jIM6Z++n7J+WPcy3EN/z/9b0cX3HWTDg5T6AAGI7JRc3N3qzVznIieeeAGf48
         8A3zhTUWO4awoeS8Zi/eMHDl/gTTeYCP0lbNKGsX86FTf0007lbkGQ2rQ/6oN003CQvO
         BaGXirK7QIRBxHOVT/NCiSqVA55dpuwcvrXZKEXPgGwJdjhy8eqHCh1zobJVsOsHEQs9
         Fz/A==
X-Gm-Message-State: APjAAAVtE0qSUVrmmICzRfmlZIMD9luelyvBngk9INmd1IZZLDt3Pq2l
        aPhrkQ/6arDCbDAP+nIIXK+IZrlReLOPkA==
X-Google-Smtp-Source: APXvYqyyAn6bk19dFw/h8K3k9hs4B4+QhpwhWaWw1cqSkTdwcOMk0Wzt8k8sshiZGSY5afTjU6b0ug==
X-Received: by 2002:a5d:6581:: with SMTP id q1mr10753633wru.393.1570763932733;
        Thu, 10 Oct 2019 20:18:52 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y186sm13983295wmb.41.2019.10.10.20.18.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 20:18:52 -0700 (PDT)
Message-ID: <5d9ff49c.1c69fb81.faa2f.38de@mx.google.com>
Date:   Thu, 10 Oct 2019 20:18:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: gpio-v5.4-2-19-g4002d58d2f8d
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 46 boots: 0 failed,
 46 passed (gpio-v5.4-2-19-g4002d58d2f8d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 46 boots: 0 failed, 46 passed (gpio-v5.4-2-19-g4002d5=
8d2f8d)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/gpio-v5.4-2-19-g4002d58d2f8d/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.4-2-19-g4002d58d2f8d/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.4-2-19-g4002d58d2f8d
Git Commit: 4002d58d2f8d3667e0597693252a7e03e40613a5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 42 unique boards, 13 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
