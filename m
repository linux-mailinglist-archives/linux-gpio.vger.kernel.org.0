Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478D06A946
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 15:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfGPNLX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 09:11:23 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:45467 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfGPNLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 09:11:22 -0400
Received: by mail-wr1-f52.google.com with SMTP id f9so20866113wre.12
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=M/HoNK1WSBCok6gEkln/U70hrkxDvo/+DXqHE0CKZDU=;
        b=bN1kWG4ZEgE1pj8eiQP3dGV048BRonuWqrnjHQIHzTtnWyWSd9DcJpqQmydVrzR3it
         3GV8zYJ2mY/nJ2awzOM8ow9fUX/ustpbFS5ATXE0I942yKPZhPyl62gKvM/XUILNQ5vf
         miz1RQqN35G3ObdU1JAOEfsKb6QTcRsZ4a2kbI95YmvsA0fmf1CybWcPQPUa7Nql6fDu
         q/kUM+1xmqjEo6xYxy/uKaJtHwSzCP0CpGgb683vn6G2HyhbGFnOTYbe/BrDmUArRZQV
         JGdsCvyUuOtkz9CNFyPbDNs3F416yGHbPpjWhbvKJj98gg9qQ3QCYt0okxn+BbY7QTl6
         1TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=M/HoNK1WSBCok6gEkln/U70hrkxDvo/+DXqHE0CKZDU=;
        b=FUMWICKJ3UcfXDB/f1GwZCra9yU72iHbyZW6Qw5+IuD54BocEl6I6YKAnYMLG/snF8
         XPuqEngsGf053CTwx2Q6y0FttV23OQUUegc2eCgFFoY6PJnPnOYNZsdif6jvJNxOyg6f
         t/KLLZkrXmOSg/L70sSXZ09HJvMM8VwXXyNp4jAJ5XX1lH/O4C6HYXGP6NO3zWIDHMnZ
         cMJ4DR36pswOklsUyJaK9UzJ9IqCQms4At67nyVnRvifGclKc51n4URdGD0VrBS3EUYP
         r6AUFaZVvd1sHm87ZmyoXCkz1bdZC/TEYOwRhBgfc+MGU1dVYTK0HJ2FWXIyA7f1I2V5
         xf3A==
X-Gm-Message-State: APjAAAVbu+fSTcoa4PUXSOeX0PPYbGXKzSKgDV4zCY7bbjSH69KTdcKU
        Mc7izjRLir/wlgH83kCV662wCyCU0xw=
X-Google-Smtp-Source: APXvYqxibRD0/jMM3pBnyH3sTSxQdbl4sIdgQ/b17rFIZcWrujP6t5HvXqEJEvIPcNAPP1znn3OLwA==
X-Received: by 2002:a5d:62c9:: with SMTP id o9mr34275869wrv.186.1563282681020;
        Tue, 16 Jul 2019 06:11:21 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 32sm15283852wrh.76.2019.07.16.06.11.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 06:11:20 -0700 (PDT)
Message-ID: <5d2dccf8.1c69fb81.f72ba.2482@mx.google.com>
Date:   Tue, 16 Jul 2019 06:11:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.2-10813-g88785b7fa74a
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 42 boots: 0 failed,
 42 passed (v5.2-10813-g88785b7fa74a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 42 boots: 0 failed, 42 passed (v5.2-10813-g88785b7fa7=
4a)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.2-10813-g88785b7fa74a/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.2-10813-g88785b7fa74a/

Tree: linusw
Branch: for-next
Git Describe: v5.2-10813-g88785b7fa74a
Git Commit: 88785b7fa74ae2dc52f879140b976984b5374c79
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 29 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
