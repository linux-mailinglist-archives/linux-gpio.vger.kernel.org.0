Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52F67193B37
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2020 09:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgCZIkA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Mar 2020 04:40:00 -0400
Received: from mail-pj1-f52.google.com ([209.85.216.52]:54867 "EHLO
        mail-pj1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgCZIkA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2020 04:40:00 -0400
Received: by mail-pj1-f52.google.com with SMTP id np9so2154349pjb.4
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2020 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IKXhnF5b2kRgiDvzdR+SY9Zq5PCgZZoxHrwTjIDIIpI=;
        b=R86WI5i7M4bE9t90PBJNrmzOvBRXoU1jrPqWg/bEzX2gSIvjGDY+OMedebCGts67QV
         t3sWczj1HzPFK0gkr+iKy9MKztafPXEYKXrfoYNVGFjvzr8n99jIeYrNFh0cK5+G7iKC
         ptxkHewHPNpLVTjZnhmUIxWx7AfKCan7/tQYZK6YK4fjEVNRYBPKrF4DM5mErv0AaUoY
         FjUWg1obGtMZjWrqLaGpAckixjehm3iBXIahHlcj8jwjYsuc9WS8mAjTfP4zvRIRttPW
         3ipytsqzDS58xloyixMIRmeLnQtZVg1WYQZm+zEXXiJu0ZU2GhkTbg+sbiFe3mmHO6QE
         JlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IKXhnF5b2kRgiDvzdR+SY9Zq5PCgZZoxHrwTjIDIIpI=;
        b=tDUWTEHVoICDL3wvf6mt7AX7tJjX2UobYkJ+q0CufVweUFPXwMoOZhKpE8Hii1/AMt
         BjY7x4hD3uKekUlIpQkYCtok3gQUVOJSpsC4cIzOFKYH/akfNiOemrXjlcC5oVYXGtxb
         wDqigo8+8Pal5jQ2YxFoTxvnN4ubxI3lHEpMzVJ+0mzrdTQppAgAGyYsjTst63VbgoFv
         f66gSrM4IhnHwNS8+xJFhkGic1jevszK910bPTV12Rv0hs6ne64DBoZQUkviulwr7MOz
         UclBTIRT3PB4zNQy/ExyME3Oq1q54xJbHgkHkXVqXEr0yveYZQ8Gt2rXhWtgZDFqKy7A
         h4dQ==
X-Gm-Message-State: ANhLgQ1inX+eMU0jsy6bsg5fJ3EuCiInEwew+Q6629u3K88CVUGdOKAF
        m2oOyMUaGDhgXLqTqcqc0AT8cGmNNCw=
X-Google-Smtp-Source: ADFU+vv1OCetkzQi3iop0jjfVcekp9efdIwEQHthy4y6FRhi3WXzYxEey9J+geFtSG80bj1Kwnlgqw==
X-Received: by 2002:a17:90a:20f0:: with SMTP id f103mr1850407pjg.88.1585211998744;
        Thu, 26 Mar 2020 01:39:58 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k6sm1095835pje.8.2020.03.26.01.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:39:57 -0700 (PDT)
Message-ID: <5e7c6a5d.1c69fb81.7a675.4378@mx.google.com>
Date:   Thu, 26 Mar 2020 01:39:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc1-47-g5eefcaed501d
X-Kernelci-Report-Type: build
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 6 builds: 0 failed,
 6 passed (v5.6-rc1-47-g5eefcaed501d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed (v5.6-rc1-47-g5eefcaed501d)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.6-rc1-47-g5eefcaed501d/

Tree: linusw
Branch: devel
Git Describe: v5.6-rc1-47-g5eefcaed501d
Git Commit: 5eefcaed501dd9e3933dbff58720244bd75ed90f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

---
For more info write to <info@kernelci.org>
