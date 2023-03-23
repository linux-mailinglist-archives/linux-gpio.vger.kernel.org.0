Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9A66C69A4
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 14:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjCWNhD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 09:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjCWNhC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 09:37:02 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A661B2D4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 06:37:01 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id h25so16097325lfv.6
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 06:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679578620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXJIw2DRUxIwJEoYqYmceOuZSvFzwdb28m7MSqdWoXM=;
        b=MrSJAmN/vlZXEHU6S8fGGA4l4vFtC5Ub+bLrkoQ5i9EYYjwlWmM/BeUKRR5nMqIxgc
         lYgk4zxZgG28JCwPHQn0J5UkU3y6a1bZsi7k+61mf1bGx04m4OAcTUotVhZ7M4dQFrvC
         SrfLXPd5xEqtlB2WXivjZC6bw84f09mFKCgLaSt6vJ9npFgV9F9JJGaw7D7HZY7KJBbJ
         mynYCaEnvOQWzscP9QA0re3X83zazYTQBdljYIxn2wqxnsa3nmIOstxvjLVA0lVwRy5X
         S/II5brY53qae/muD02/bRChiDMI6GSoE3VqkfZiPi72DWZ1fIqGYFRYIVyFo0L03aw4
         zOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679578620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXJIw2DRUxIwJEoYqYmceOuZSvFzwdb28m7MSqdWoXM=;
        b=6hR4EbQtgexT2DzevZTx8FJTM7vxsqvKvHrgeVKqDL4cBrTYvqbhWTH9f5cuvPKojx
         ZgJl666c7o7ptus1cMvwsn6UKoLcPvuPgfy8pOiXojX7UQLKi+Zie8eUK55UURtgavvK
         /E48U1g8Jdtjfui8zu1KmkEbZX/SykUZEIf0WJXsKV83EQFK5ywhaejN89LkWKltXMOD
         PYPyg2qjtYJY9I08FjI+SdnEeXaDf8oHi6OxjceIh9zvHG50jriVkWaBhV4i3xfYVo36
         HXhnAQkZNgWmUsoPRCKu4bqkfMw4BD7gNDUSCcqKVuQpcFquBQlOmaLAvpoGUfADjt2+
         ewjw==
X-Gm-Message-State: AO0yUKX1yji+0CaXnm309kDCMOzpkC2pZlgrGh5/4ao4ybQ1BeA1gtUE
        N6r3uPnFykzneT7S6lvHAhRpyg==
X-Google-Smtp-Source: AK7set+suNOHq9J1H5vslivj2kMvIqhZJxdOWiBPqX0o44F4im9e4/BJhrVUnBJbxDhGIANJzKhpRA==
X-Received: by 2002:a05:6512:517:b0:4d8:51e7:9f23 with SMTP id o23-20020a056512051700b004d851e79f23mr1854422lfb.34.1679578619964;
        Thu, 23 Mar 2023 06:36:59 -0700 (PDT)
Received: from fedora.. ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id h11-20020ac250cb000000b004db3d57c3a8sm2936566lfm.96.2023.03.23.06.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 06:36:59 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
Date:   Thu, 23 Mar 2023 14:36:56 +0100
Message-Id: <20230323133656.679478-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Functions that work on a pointer to virtual memory such as
virt_to_pfn() and users of that function such as
virt_to_page() are supposed to pass a pointer to virtual
memory, ideally a (void *) or other pointer. However since
many architectures implement virt_to_pfn() as a macro,
this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix up the offending calls in arch/m68k with explicit casts.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/m68k/mm/motorola.c | 4 ++--
 arch/m68k/mm/sun3mmu.c  | 2 +-
 arch/m68k/sun3/dvma.c   | 2 +-
 arch/m68k/sun3x/dvma.c  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 911301224078..0a9bc8292f78 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -102,7 +102,7 @@ static struct list_head ptable_list[2] = {
 	LIST_HEAD_INIT(ptable_list[1]),
 };
 
-#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page(page)->lru))
+#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page((void *)page)->lru))
 #define PD_PAGE(ptable) (list_entry(ptable, struct page, lru))
 #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
 
@@ -201,7 +201,7 @@ int free_pointer_table(void *table, int type)
 		list_del(dp);
 		mmu_page_dtor((void *)page);
 		if (type == TABLE_PTE)
-			pgtable_pte_page_dtor(virt_to_page(page));
+			pgtable_pte_page_dtor(virt_to_page((void *)page));
 		free_page (page);
 		return 1;
 	} else if (ptable_list[type].next != dp) {
diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index b619d0d4319c..c5e6a23e0262 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -75,7 +75,7 @@ void __init paging_init(void)
 		/* now change pg_table to kernel virtual addresses */
 		pg_table = (pte_t *) __va ((unsigned long) pg_table);
 		for (i=0; i<PTRS_PER_PTE; ++i, ++pg_table) {
-			pte_t pte = pfn_pte(virt_to_pfn(address), PAGE_INIT);
+			pte_t pte = pfn_pte(virt_to_pfn((void *)address), PAGE_INIT);
 			if (address >= (unsigned long)high_memory)
 				pte_val (pte) = 0;
 			set_pte (pg_table, pte);
diff --git a/arch/m68k/sun3/dvma.c b/arch/m68k/sun3/dvma.c
index f15ff16b9997..83fcae6a0e79 100644
--- a/arch/m68k/sun3/dvma.c
+++ b/arch/m68k/sun3/dvma.c
@@ -29,7 +29,7 @@ static unsigned long dvma_page(unsigned long kaddr, unsigned long vaddr)
 	j = *(volatile unsigned long *)kaddr;
 	*(volatile unsigned long *)kaddr = j;
 
-	ptep = pfn_pte(virt_to_pfn(kaddr), PAGE_KERNEL);
+	ptep = pfn_pte(virt_to_pfn((void *)kaddr), PAGE_KERNEL);
 	pte = pte_val(ptep);
 //	pr_info("dvma_remap: addr %lx -> %lx pte %08lx\n", kaddr, vaddr, pte);
 	if(ptelist[(vaddr & 0xff000) >> PAGE_SHIFT] != pte) {
diff --git a/arch/m68k/sun3x/dvma.c b/arch/m68k/sun3x/dvma.c
index 08bb92113026..a6034ba05845 100644
--- a/arch/m68k/sun3x/dvma.c
+++ b/arch/m68k/sun3x/dvma.c
@@ -125,7 +125,7 @@ inline int dvma_map_cpu(unsigned long kaddr,
 			do {
 				pr_debug("mapping %08lx phys to %08lx\n",
 					 __pa(kaddr), vaddr);
-				set_pte(pte, pfn_pte(virt_to_pfn(kaddr),
+				set_pte(pte, pfn_pte(virt_to_pfn((void *)kaddr),
 						     PAGE_KERNEL));
 				pte++;
 				kaddr += PAGE_SIZE;
-- 
2.34.1

