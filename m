Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3493230511B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 05:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239399AbhA0Emj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 23:42:39 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:31559 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403925AbhA0ARj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 19:17:39 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210127001655epoutp03b49d9b937d6a0f2e46d091b0f36b37c6~d7qCcU72a0476504765epoutp03C
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 00:16:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210127001655epoutp03b49d9b937d6a0f2e46d091b0f36b37c6~d7qCcU72a0476504765epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611706615;
        bh=bsKjPI8dJEliK0xVfo3u1qjuGRVdT83SjJXrgzobAhk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=bkoYM76cpO6L4P/pWhPY9Ca+DSTazzIZKu5rXLZId+dUJ8tG8ehSQ8sTZCjXTUOhs
         K3F8h5IJYzUsd2m6mbzCzc83EZo8v5EdFlw9IFWQseczE5MHDfNXDkRnydrCOFDxPk
         /vNq1RRPjctYPGuVbkAhcNGWlQstSzYxsd5mP0DY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20210127001654epcas2p40ab53364d8dbfa334113819602416d9d~d7qB2zdrw2030920309epcas2p4I;
        Wed, 27 Jan 2021 00:16:54 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.184]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4DQPKw3j8pz4x9Pv; Wed, 27 Jan
        2021 00:16:52 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        31.29.10621.DE0B0106; Wed, 27 Jan 2021 09:16:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20210127001644epcas2p13cbc984fecc3ac7700a422488b488135~d7p4hp67R1532715327epcas2p1M;
        Wed, 27 Jan 2021 00:16:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210127001644epsmtrp23221aaacf2ec3df5371d340ce85df2ff~d7p4g0YFi1792817928epsmtrp27;
        Wed, 27 Jan 2021 00:16:44 +0000 (GMT)
X-AuditID: b6c32a45-34dff7000001297d-4f-6010b0ed90af
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A1.79.13470.CE0B0106; Wed, 27 Jan 2021 09:16:44 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210127001644epsmtip1e5a8bccb2f11d5199af35c81f076d940~d7p4TpERh1392513925epsmtip1Z;
        Wed, 27 Jan 2021 00:16:44 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH] pinctrl: samsung: use raw_spinlock for s3c64xx
Date:   Wed, 27 Jan 2021 09:16:31 +0900
Message-Id: <20210127001631.91209-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgk+LIzCtJLcpLzFFi42LZdljTVPftBoEEg5YlShaX92tbnD+/gd1i
        yp/lTBabHl9jtdg8/w+jxYzz+5gsDr9pZ7VYtesPowOHx85Zd9k9Nq3qZPO4c20Pm8fmJfUe
        fVtWMXp83iQXwBaVY5ORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+Ti
        E6DrlpkDdI6SQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8DQsECvODG3uDQvXS85
        P9fK0MDAyBSoMiEnY+Lv9+wFU7krbn3cyN7AeJazi5GTQ0LAROJk817mLkYuDiGBHYwS7d9u
        MUI4nxglHrf8Y4JwvjFKHGo6xw7TMu/dcXaIxF5GicuTJ0H1f2SUmLRxHzNIFZuArsSW56/A
        ZokIrGSUWP58IdgsZoFJjBLvnj9nBakSFrCXuHpyH5jNIqAq8WvCXLBuXgE7iS/HV0Ptk5c4
        ufYwE0RcUOLkzCcsIDYzULx562xmiJpb7BKdsxy6GDmAbBeJDT9zIcLCEq+Ob4EaIyXx+d1e
        NpAbJAS6GSVaH/2HSqxmlOhs9IGw7SV+Td/CCjKHWUBTYv0ufYiRyhJHbkFt5ZPoOPyXHSLM
        K9HRJgTRqC5xYPt0FghbVqJ7zmdWiBIPiQt3y0DCQgKxEqe2TmOcwCg/C8krs5C8Mgth7QJG
        5lWMYqkFxbnpqcVGBYbIkbqJEZwktVx3ME5++0HvECMTB+MhRgkOZiUR3vfKAglCvCmJlVWp
        RfnxRaU5qcWHGE2BgTuRWUo0OR+YpvNK4g1NjczMDCxNLUzNjCyUxHmLDR7ECwmkJ5akZqem
        FqQWwfQxcXBKNTBt3azQdtWuuubv/erpt/y/SuV/zJUP2Hli1RPdukUX578/cuntxwWn0tXN
        pz5vPTz9mdHUc7vMvNXqati6d+UwfH44yzxPuOZV1oxwy8lZsvFOkxUfG6w5tSnotkaN9+8j
        Psl3a3Y3tgfuU53zRfqf0B/Tp9vuvdXJskzZ9sJkerLCok8aJwyDf+VL32W7Pse/0zpfNf9L
        mUx8QJrDRP/LTW/jEw0nqxXMs/i/ufbVNSWm1pa5WzyPfdfIuTz/2t5Gv2/Jmfl5pVYv5vuW
        ffi+NSvvrMN+/Z8bZQqXGWTrrn6Yc2jCTlfphVc+dq4Qnaf4ipHlI+/Pay1exUFb/dTezwh6
        E3S21PXhuRmPLm4PVmIpzkg01GIuKk4EAK8JZsIbBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWy7bCSnO6bDQIJBm9OyVhc3q9tcf78BnaL
        KX+WM1lsenyN1WLz/D+MFjPO72OyOPymndVi1a4/jA4cHjtn3WX32LSqk83jzrU9bB6bl9R7
        9G1ZxejxeZNcAFsUl01Kak5mWWqRvl0CV8bE3+/ZC6ZyV9z6uJG9gfEsZxcjJ4eEgInEvHfH
        2bsYuTiEBHYzSly68psdIiEr8ezdDihbWOJ+yxFWiKL3jBL3VjcwgiTYBHQltjx/xQiSEBFY
        zSixbcIUMIdZYBqjxKp9bSwgVcIC9hJXT+5jBbFZBFQlfk2Yywxi8wrYSXw5vhpqhbzEybWH
        mSDighInZz4B62UGijdvnc08gZFvFpLULCSpBYxMqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS
        9ZLzczcxgkNXS3MH4/ZVH/QOMTJxMB5ilOBgVhLhfa8skCDEm5JYWZValB9fVJqTWnyIUZqD
        RUmc90LXyXghgfTEktTs1NSC1CKYLBMHp1QD0/ZXMRsDLN5nlN15e+ts+iGJicKRLk0/Pe6e
        M+zo6F/yXtAoJOLBhflfsp/vLWtafUU+0OlWh6DISvbHlSb83SETVkSt+ur9ozpectmZjSxc
        C54H1riWf3HZs7VkqWey71MV6+ft1TIPTUU8y06cdN22pXm7auPpTxF+95uk2a57Oc3PTcnc
        mL3lh1ei2Z6Ov6oaLx4lS018vCisSndtBEclN4OwY0MRf+0XHVsfI+3aFNPrl6e86TBXe5pp
        rumr+TL/ipOTfLeycDfzp3Wqd4vaD1dGr7u8YdoM6aii1JYFDX+tFbQKsz8c3OvxJKQpZL9d
        m3zOfZYP38O53qY19Z/3Om+V8v/mk653hrpKLMUZiYZazEXFiQD0EZWuzAIAAA==
X-CMS-MailID: 20210127001644epcas2p13cbc984fecc3ac7700a422488b488135
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210127001644epcas2p13cbc984fecc3ac7700a422488b488135
References: <CGME20210127001644epcas2p13cbc984fecc3ac7700a422488b488135@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch converts spin_[lock|unlock] functions of pin bank to
raw_spinlock to support preempt-rt for pinctrl-s3c64xx. Below patch
converted spinlock_t to raw_spinlock_t but it didn't convert the
s3c64xx's spinlock.

Fixes: 1f306ecbe0f6 ("pinctrl: samsung: use raw_spinlock for locking")

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index b8166e3fe4ce..53e2a6412add 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -286,14 +286,14 @@ static void s3c64xx_irq_set_function(struct samsung_pinctrl_drv_data *d,
 	shift = shift * bank_type->fld_width[PINCFG_TYPE_FUNC];
 	mask = (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) - 1;
 
-	spin_lock_irqsave(&bank->slock, flags);
+	raw_spin_lock_irqsave(&bank->slock, flags);
 
 	val = readl(reg);
 	val &= ~(mask << shift);
 	val |= bank->eint_func << shift;
 	writel(val, reg);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
 /*
-- 
2.30.0

