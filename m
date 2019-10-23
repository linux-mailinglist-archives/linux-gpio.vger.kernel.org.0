Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 766F8E22C2
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 20:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390517AbfJWSxa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 14:53:30 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52709 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389636AbfJWSxa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 14:53:30 -0400
Received: by mail-wm1-f66.google.com with SMTP id r19so75703wmh.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 11:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zhUDGO9/V0Vnweo3jCRjvtXqMGxR/azcimqcNrR0bWI=;
        b=2GSeX3YBH0+vonH6pWukPwvjDfAO5MaLUTXWlNyWgg82qzTv2d0dFzkcXiFHlNnuPy
         siOV/Blq+hWm/QIjm2eX3AAixRSGweKZSEmyU0IvEp+JPNR7iO+dij/0OlqKKnc786D0
         QTX2ohJv/jDTky7NhB+uxN/GaX9nlGZ28N7P1U5AGXspo9qI8G1zcjgowE1L0+YYPsY2
         k6QFvpKXRca/9l88GTNa/QnzsaVcu5c7oVYIHzory7mh5EinzE619UfhVbs7j8teiV/Z
         M1PWzgJh2r4Yo0kncm6JIRm37zKF1Ue5jxv9NFIqA8gHuQ+PZPgk1R7gZGRDJftiVZgh
         dxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zhUDGO9/V0Vnweo3jCRjvtXqMGxR/azcimqcNrR0bWI=;
        b=c2Uxnhd5eH+uKSZiGUDns/JDCHbsWpKr9laoKeNCxighPv/ssI4sPThrgVC2IuA7ea
         a4eskSBJLVlRAfBItIqZZTnQViIxqwPgahmJSR03QWv4EGpaKwFv2TqJ7UK9rLERxLOA
         z93Cv+5GkGpiJ11XNZZkxEdmoC981tbNusEhN9x5JUT3iBuL2HE6bSTtcW9lLivQA1W0
         xiS0bxy6W1qDh/I/yVzixXUwJVgVAN2ksNu+wkppd45jutb9JiAdbQy6oUDalWdhlYAs
         TcvYFh/qI1luZbfIMIELHkJuiY+B9BnqTTlEysPHuUMmDAElpwhWKoQGQVPe2yFK0Fj1
         J36A==
X-Gm-Message-State: APjAAAWkM4JWifCQjt/mO0S8b6C1HpvktnHL+sb5l0uvOHQrrYCphIQw
        +on47QbeHw975K+0iG/HMx4IKSGXKizE8w==
X-Google-Smtp-Source: APXvYqz+z2z1XgYyDo+f1Mc2IEgsdMllfvAo8gDmg8M9k0URuW5eNWx1Ad/wkFHsB6kbxCkVlMgnfQ==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr1221571wmc.121.1571856806467;
        Wed, 23 Oct 2019 11:53:26 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j22sm26511906wrd.41.2019.10.23.11.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 11:53:25 -0700 (PDT)
Message-ID: <5db0a1a5.1c69fb81.c5cb8.1f58@mx.google.com>
Date:   Wed, 23 Oct 2019 11:53:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-28-gacba5fc211ee
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 39 boots: 0 failed,
 39 passed (v5.4-rc4-28-gacba5fc211ee)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 39 boots: 0 failed, 39 passed (v5.4-rc4-28-gacba5fc21=
1ee)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.4-rc4-28-gacba5fc211ee/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc4-28-gacba5fc211ee/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc4-28-gacba5fc211ee
Git Commit: acba5fc211ee5159bcbcec67a0ce264078286625
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 34 unique boards, 12 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
