Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612E4AFD10
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 14:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfIKMtr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 08:49:47 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:41773 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbfIKMtr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 08:49:47 -0400
Received: by mail-wr1-f53.google.com with SMTP id h7so23400179wrw.8
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 05:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Xb5o6JHUOm83VaIhYQzsrxLDdRcz1cv/ZMxM98v5FC0=;
        b=Mvx8Xl6RouiSNebqkDbufi5lOZoc0BnTwlC+JKNoR09PGUx+TAzy9Ja3k/Me69ShYN
         GoXqrTcmTGAv1emwQWaUVKm2NSi5+ZK5yEd8gXBhkN165h+U53hnzoyODNt8ugeS2vD+
         WGBI7h7erjkNzIKDpNrf+8eM8DEsjYictF6j+WdEamUBQyEd1m7lbg3/Z31adlWaAsVP
         gDwj7hvnZmqJ+/PhwRCdVl6rDb34lccVCeEgJgLLdtOxnDbfig9tEJV/EiCDqfB6SDN9
         KksuCZ8jaZ3I3fUGclIwyafSkly2Yp2BiBBvxwkPsb3eRr439bdw2YtNXWtPnVECeE2s
         BQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Xb5o6JHUOm83VaIhYQzsrxLDdRcz1cv/ZMxM98v5FC0=;
        b=ZokHvxoxX2YoDIW7r6xXxUoL6VdpVhPoDqnh6Ehcc9yE0LRIqhbtGdTOBKDlok8XjA
         HUUIPsIcrx0FYRpvWzz1Tn6Kojn5FqC26rYnUFQmLCJ2lyd/lwAu0mEMM+NT3yLv7Ehm
         qd95x2GAS7QKRdgZzP7KHPoaPTFFC7F74IIC+OfaD6IwveHBNbWpUe3y97zO9/vpFYVX
         XBHLaWz6eORai9OZCny2QYjMVt0GhSX+3lFrl7ZIRc/CiwzU3drCdaxqI0eYniAJr5fA
         7GTjZ7SRvE7B1oAecq9ePzcEUdcMHhAuISyTxajoqo8MG4LnZ9gYNk2YA9+B4vHAKYMv
         JHtQ==
X-Gm-Message-State: APjAAAWSeV6+D+VuENarpZDKC9ptLPk0Ud6RVoc/9WkvsWjRGm8okgPC
        m8/qz2POzK7PDxnEtZfzf4fS+9jZSAK+zA==
X-Google-Smtp-Source: APXvYqxySIyXlmB3UmS6FgjNN1w8W/YFkjc3NKhRL63fVQlSlMu2wAj+7P+Zj0Tw5Q/iuHE8I538jQ==
X-Received: by 2002:a5d:5345:: with SMTP id t5mr11143784wrv.30.1568206183722;
        Wed, 11 Sep 2019 05:49:43 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a205sm5043129wmd.44.2019.09.11.05.49.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2019 05:49:43 -0700 (PDT)
Message-ID: <5d78ed67.1c69fb81.55be2.943a@mx.google.com>
Date:   Wed, 11 Sep 2019 05:49:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc8-84-g686cfd3d959f
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: for-next
Subject: linusw/for-next boot: 49 boots: 0 failed,
 49 passed (v5.3-rc8-84-g686cfd3d959f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next boot: 49 boots: 0 failed, 49 passed (v5.3-rc8-84-g686cfd3d9=
59f)

Full Boot Summary: https://kernelci.org/boot/all/job/linusw/branch/for-next=
/kernel/v5.3-rc8-84-g686cfd3d959f/
Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.3-rc8-84-g686cfd3d959f/

Tree: linusw
Branch: for-next
Git Describe: v5.3-rc8-84-g686cfd3d959f
Git Commit: 686cfd3d959f7f2459f7021fe9efa3ab5f79585d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Tested: 43 unique boards, 15 SoC families, 3 builds out of 6

---
For more info write to <info@kernelci.org>
