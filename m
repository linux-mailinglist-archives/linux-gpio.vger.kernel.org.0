Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0B58AA0CA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 13:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387964AbfIELC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 07:02:29 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:52020 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731215AbfIELC3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 07:02:29 -0400
Received: by mail-wm1-f47.google.com with SMTP id k1so2278541wmi.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 04:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LVzsaDVy8WD8lZaeEMLp/0wRYK72Cg6EMs/d7xpBaH4=;
        b=AjzaPfFsx3Pb1egxA3PwyTYs7FEm6nxUn9J13tL5thR+IGuqyGiejqxtZOAXLqsKHT
         wx5DF/rGg3q5Lo9LfQDTNJRrYw3LseKuLkaNSgf2qIbW/w577h/rfd8kV+GxMfTtkOVN
         ftF+WwZxyo2hN3/Jrk8o+VED4zASxsa0s/lzrvOoKWZV88ex0ohP8WhG7kv9XY3x3PbF
         2owB2dp6Vf/vcRme5O1pu9TbO7jCG3VUlw+ipbqbzRPncfZqULiSQsDjgpWg9qoYqphi
         8PBAYjjDmlC6BLA7PJDIe8e9eeFNnH1C4l3z47z0COvJts4bkl3wWLBfw4Xoh+zBXHxl
         daAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LVzsaDVy8WD8lZaeEMLp/0wRYK72Cg6EMs/d7xpBaH4=;
        b=mjRn+m0tdVimCbjNwJcO0uljbOdwhT+3nBAYLmxNM6OUdQUvSsIvePI6E2J+3ymT+D
         sViGGCN5ARfTt7MbEB19m5Fwu6+LVAJqphDfFvG62bM8DJZugUTF6RZJmTwtgwK73B0/
         xjE/tXWNVFOAvDa9ra+35Qrf/ipB7XMj5kZ4z2VHqlMbp69Hp958HWSaUYt2maRH3jDp
         tPaCmXWebjNiFwGcbh2QDPAHIcJIrOP7odMuPqdckcmnjBdXXs/QqbsLkeAplf0vksCd
         D6ZCKaAmPKRLp3pS/bLw7SjUP8VB5lk+CyMPkAaJR2ACyuEmNQNsK5Tmmyi6ObtI0oqp
         YZQw==
X-Gm-Message-State: APjAAAUQXhUyF0Rx2jihdoK7ryYtc1rE7cIdZaV6qZGcMteX5YyIULZx
        VGvweLNG/3KWc9DAvdme8IPCfZscKbfUOA==
X-Google-Smtp-Source: APXvYqwbDVQAUfXSeSe2+YKI0rQUvFjDiIueXNlo9kVyBmk1y0w0kCrgCQd27N9aXjOBc3B7iVxlDw==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr2509470wme.89.1567681347383;
        Thu, 05 Sep 2019 04:02:27 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j22sm3437895wre.45.2019.09.05.04.02.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 04:02:25 -0700 (PDT)
Message-ID: <5d70eb41.1c69fb81.48ae2.f83a@mx.google.com>
Date:   Thu, 05 Sep 2019 04:02:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc7-63-g151a41014bff
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: devel
Subject: linusw/devel boot: 4 boots: 0 failed,
 4 passed (v5.3-rc7-63-g151a41014bff)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel boot: 4 boots: 0 failed, 4 passed (v5.3-rc7-63-g151a41014bff)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/devel/ke=
rnel/v5.3-rc7-63-g151a41014bff/
Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.3-rc7-63-g151a41014bff/

Tree: linusw
Branch: devel
Git Describe: v5.3-rc7-63-g151a41014bff
Git Commit: 151a41014bff92f353263cadc051435dc9c3258e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 2 unique boards, 2 SoC families, 1 build out of 6

---
For more info write to <info@kernelci.org>
