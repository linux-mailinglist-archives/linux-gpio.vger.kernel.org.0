Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92319CCBEB
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 20:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387486AbfJESIq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 14:08:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38963 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387477AbfJESIp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 14:08:45 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so10719998wrj.6
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 11:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hpUjpsgXV8+HS0414n9GMWqnLM8SeDqNUx8RJ4V0lBw=;
        b=Z8+1+UYMbjcubl6actPebyFcP5hE8boGoTZHoVGZzWWzt2uWq1YxgXQq9F26kPjqUl
         fxriLt9sDFOpiolHKtptMkmYhVtdaVmZxftQNDXAMU60NREijzJ7GPMJTW5qRc5ItOpD
         Z0e/zS/tL54NEQ1ndQMMA8AkwotYyE9tEv2jOK7yvblSJkGOAm1hmrcYKyGio0OSkk2L
         TWo1xEbeHtAZTC6FkymWgMhuKkvGT/zlf2dywrUSQzlDKrokr/vBNTm3leOZq6ouydmT
         0aj7qKGU5B/5cB5xCzkVPa+98E+8ubHGA/BwZkagBZ1lqFlhfq3m4KvTHAU9JQ4hAjAx
         f22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hpUjpsgXV8+HS0414n9GMWqnLM8SeDqNUx8RJ4V0lBw=;
        b=iKwsKF+CIZHbe5r1B5tnmtF6K9qWH511rYsc2nzsP077RZOCshc3vcDgoXvPWT/pVp
         OFCCXxoqqxxBWjpYySEbtNTbvg20kEkil85Z8KX2VojMxPxpGb8x9EdI+7XehRV70uzM
         WvnA7A0vStAx+9DpPEhwAK/a9jX/MiI0UKxkEpWM/iHSANJ2ckifzyzAG+wcb0I6Mzhy
         Mng0TpX2WZ1EqBr8NaDY5N8BJFHnjMfZopqas5eSnhhEDwD2Kgk9QePRbQul2Y1JbJga
         XtVNKRnNChAPR+vnS74DQfue/TU2PMKqxK5OOr7R8k8CPXWHIYnMlppw9+LWVbxxoGs2
         AaLA==
X-Gm-Message-State: APjAAAUeeT+ZqhppsTCEIe6ATXufwTwaNNzud7oHsq+IfjdObThMxDJB
        XSjMcmVvIOk4IiqMDD5tEGk5F2pAd04=
X-Google-Smtp-Source: APXvYqzeAHYM/j6QimuBYfy2bH/4DGDnclaueAKNt5RdipzqtRfVq9sBYFQbQ4qFAbb4O07H1qch2A==
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr16596519wru.267.1570298924057;
        Sat, 05 Oct 2019 11:08:44 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 33sm14867472wra.41.2019.10.05.11.08.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 11:08:43 -0700 (PDT)
Message-ID: <5d98dc2b.1c69fb81.50aa8.3cfc@mx.google.com>
Date:   Sat, 05 Oct 2019 11:08:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-5-gfffa6af94894
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes boot: 43 boots: 0 failed,
 43 passed (v5.4-rc1-5-gfffa6af94894)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes boot: 43 boots: 0 failed, 43 passed (v5.4-rc1-5-gfffa6af94894)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/fixes/ke=
rnel/v5.4-rc1-5-gfffa6af94894/
Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc1-5-gfffa6af94894/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc1-5-gfffa6af94894
Git Commit: fffa6af94894126994a7600c6f6f09b892e89fa9
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 40 unique boards, 14 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
