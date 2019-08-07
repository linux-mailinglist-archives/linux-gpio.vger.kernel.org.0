Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9908F850DC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 18:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388627AbfHGQR2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 12:17:28 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:36169 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388603AbfHGQR2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 12:17:28 -0400
Received: by mail-wm1-f45.google.com with SMTP id g67so636493wme.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fNd41wyIz4a+Gkt2L6vt9VPoaMvIo8HWqkZg43L7Rqg=;
        b=yMvNnX2qcNdCURfYi6D2M6pEDwcy4cHkiyqjizu6F7KOHLIYIPUPQpOB2cY8Dx2eiq
         LQho2oxJlY/TJe61dLR7hecTqK7NMPUSA7T1NqH41/QDLI5mvYfMR+huF9/bRsaOH0h7
         rncYJobcxJjJTbzvFJP7xuTPaq6bo0lJFSS9y+As0wgM0man1CHlEfoGVAO75o2ijdkT
         tXSD3+T0kf73wcK//pzZgs85y9dq/3Rmzf5LiiG8jUHQP5uOTdblK+5ASfaFNkFuxpgf
         d1myrLQ8pwxCrNnLKJn/9FZ2+f5T1ijaQ7JT2ehJoSYE8dJ1W2kBQ0Bly7qpZRqMKI/v
         QHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fNd41wyIz4a+Gkt2L6vt9VPoaMvIo8HWqkZg43L7Rqg=;
        b=FBXsAQqPpYh8h7iOgy8YSnWHfl1Yg94iXyeJO53IBncxoxt1E7WuqPjSOcqs989+i4
         X9O9/wXqQ2osVziAnIRk0QXDEIdMOGRKW43niZzgQfwjwuIdypucFHNB1lmtmBo2rhmq
         dvewC3ubG7qrqv7tp53Ig4rb8gU0sbJqZEZ46aLSndfCGtGQsbv9ryQaRznM8guGCsb+
         xbib9wUissGw6SomSt46tq9xG2Xpm+tNn6CqFQ0sPfFn0fXNIeKqSTT8ZwWVfgP1tSEA
         HsKkCDE3Vhtw6dhYKdQCyrpxQKl+oJC01KpNa+WJid+gDuOTDsQg34luZQt8aPq4I3io
         dyDQ==
X-Gm-Message-State: APjAAAWnvRNizdTFHXJXX/0XT+LzqUnP73xscw2BgWN57psEu6M/0YgQ
        LUOnQv/yP6MatXdJF2FDbbOtHOaNcdQ43w==
X-Google-Smtp-Source: APXvYqzJ3Ffx3Bsjza0aeeLVR4nukdwI9+q3rMXdcKIdZhNnFlaFxDc7KBQ5Gwjcnsr+Bgv2LY4sPw==
X-Received: by 2002:a1c:c2d5:: with SMTP id s204mr726113wmf.174.1565194645652;
        Wed, 07 Aug 2019 09:17:25 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e5sm85739510wro.41.2019.08.07.09.17.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 09:17:24 -0700 (PDT)
Message-ID: <5d4af994.1c69fb81.4bb98.5c77@mx.google.com>
Date:   Wed, 07 Aug 2019 09:17:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.3-3-1-g29c778ca612b
X-Kernelci-Branch: fixes
X-Kernelci-Report-Type: boot
Subject: linusw/fixes boot: 49 boots: 1 failed,
 46 passed with 2 untried/unknown (gpio-v5.3-3-1-g29c778ca612b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 49 boots: 1 failed, 46 passed with 2 untried/unknown (gp=
io-v5.3-3-1-g29c778ca612b)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/gpio-v5.3-3-1-g29c778ca612b/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/g=
pio-v5.3-3-1-g29c778ca612b/

Tree: linusw
Branch: fixes
Git Describe: gpio-v5.3-3-1-g29c778ca612b
Git Commit: 29c778ca612b3462529fdf3f094843dbf4778c27
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 35 unique boards, 14 SoC families, 3 builds out of 6

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-mhart: failing since 8 days (last pass: v5.2-10813-g88785=
b7fa74a - first fail: v5.3-rc1-4-gd95da993383c)
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: v5.3-rc1-4-gd95da993383=
c)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab

---
For more info write to <info@kernelci.org>
