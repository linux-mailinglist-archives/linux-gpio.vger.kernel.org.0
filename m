Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C190EF4F65
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 16:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfKHPX4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 10:23:56 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:38577 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHPX4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 10:23:56 -0500
Received: by mail-wr1-f50.google.com with SMTP id i12so573805wro.5
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2019 07:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Nx13y/GU9H7rLdzhcjVKkRGC7fkX4LmMlNp82WUDXgE=;
        b=Y+C6ZQzlO6JbBTm8I/ZOtZzA/J61asx2HUSmvU6gJPSXRPbkQMrc2cTXkqmvsJ1cQx
         VIO2hwG7Ybj5z5I0wWSVxGNEA6ctwJkmY63zAQ+MFxuFzJX/oxjktU+FoOxar0M3UWSf
         N84PrBqbi3IHHcb5sVmFg+pMlOdCBnP1a399YFF5T3Use0nm2LKtB99sPIgjoCClierX
         mWKizZ1E4JeUw4h0P1i/JDW8Vq6p8sTRFhwWnEFcQCeJG5dKDeLdmrgQzLcpZWNtSTzL
         QSF8e7vcuq7IuHvTK++lNDvBtVC0fL8G77UmYcDzvxUymsFCocaVPj32lFLcww396Fwv
         gx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Nx13y/GU9H7rLdzhcjVKkRGC7fkX4LmMlNp82WUDXgE=;
        b=B8e9xqDjBguUWJb011Qovs/wHD4tVj/M+EAePt+Cu3rzGjRnvS/sBhmy9uj/A6l6zq
         qbbo5KDLmz4q92c1gcOU/tCEtNj34GCKmYKkdm1DZo7n5+7Zs+ZJl3ATdkFdHeXCbJ7m
         khoZJ1gbAC78CUv45bbrRsg8kq/NpCnmWcattOFiAJDJCIH8JvvYbPLfL3sB7M8zbCD8
         Yw28PqH8V6xx/+mj0Pdmlv+/F+qOV2iZIT0EnwmCDGQl5ctKUy1Cqcl4ph0XWX7cfQV9
         /xwEQuCzJMWG5vwumw3RzjYuYMZKEZUwtY4/L2M/3WI2/e/khSI/FVWA89Ab+LMt93HG
         gbWQ==
X-Gm-Message-State: APjAAAVxgYxMX8UUNo/TerBxP1G+OW1HFcQ5ZB11HyeX9q7W4pmpqRt9
        cnKe7iqw9uaPTAiY1cOgs8fwUkhOUwLlqA==
X-Google-Smtp-Source: APXvYqwcOXmzMD0pwrLJ+Y3bck5Xo7TOM+agjMHPn2aDmk/Acr6OLNDXCz2VjaLRxFmx0FQswhAObg==
X-Received: by 2002:a5d:66cf:: with SMTP id k15mr3418756wrw.38.1573226633988;
        Fri, 08 Nov 2019 07:23:53 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j66sm5651754wma.19.2019.11.08.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:23:52 -0800 (PST)
Message-ID: <5dc58888.1c69fb81.22380.d866@mx.google.com>
Date:   Fri, 08 Nov 2019 07:23:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-44-g6b240aeb121e
Subject: linusw/for-next boot: 43 boots: 0 failed,
 43 passed (v5.4-rc6-44-g6b240aeb121e)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 43 boots: 0 failed, 43 passed (v5.4-rc6-44-g6b240aeb1=
21e)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc6-44-g6b240aeb121e/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc6-44-g6b240aeb121e/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc6-44-g6b240aeb121e
Git Commit: 6b240aeb121ec14a528a58413baa9a74f8749604
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 36 unique boards, 13 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
