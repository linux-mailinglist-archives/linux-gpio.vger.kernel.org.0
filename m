Return-Path: <linux-gpio+bounces-14551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84909A03476
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 02:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058473A243A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 01:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386287D07D;
	Tue,  7 Jan 2025 01:19:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0FE33086;
	Tue,  7 Jan 2025 01:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736212788; cv=none; b=I8DIoO+g/wT7/nULE9AU1F1wGInhW44w4T95CZUdIO9L2WkYA9LdGKlszqxFSkJ0Ez894m7mZXL7lC1Z+9FPtvXh0em3Nd4LNOSK+pkKSKigO6hGiEtbxojOidkmQOze/8V/F2O+Ewce+m6Sq/I2fjyDp7GoBRR5uHaNzEOnLtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736212788; c=relaxed/simple;
	bh=3nWmlmHVyEXXnKNprV/iXE8Bft9TELC7KR4IOBSPD+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EEVg79GopD0ZGspLogOAajV6CTqYPGLVlwTRZYdjXtbjYP9fHWF8vICrSjAzgEAklePBzlfKW4m8Da2e7zaDwULkk2teU56KbIBwLbT4+WBVaWUdoKDswF3A2RQ9fLLr6tlldgSEYi54tS9m7StKD7jSMXUO6ejFxraqg/5JNPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-01 (Coremail) with SMTP id qwCowAA3PNAVgXxnc2veBQ--.14999S2;
	Tue, 07 Jan 2025 09:19:30 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: christophe.jaillet@wanadoo.fr
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	kumaravel.thiagarajan@microchip.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	make24@iscas.ac.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH] misc: microchip: pci1xxxx: Fix possible double free in error handling path
Date: Tue,  7 Jan 2025 09:19:17 +0800
Message-Id: <20250107011917.642951-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <955f3abf-81b8-4471-82eb-b969dc5d7c9e@wanadoo.fr>
References: <955f3abf-81b8-4471-82eb-b969dc5d7c9e@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA3PNAVgXxnc2veBQ--.14999S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF17uw1fKr4rJryrWry8Zrb_yoW5JF4fpa
	9xX3WavrWUtw4xKr4xZ3WUtF13Aw40ka45Wr4DKw1Y9a9xJryIyFyv9r9F9w1DWFWUt3WI
	yF1UKrWUG3WDuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
	evJa73UjIFyTuYvjfUY3kuUUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Christophe JAILLET<christophe.jaillet@wanadoo.fr> wrote:
> Ma Ke <make24@iscas.ac.cn> writes:
> > When auxiliary_device_add() returns error and then calls
> > auxiliary_device_uninit(), the callback function
> > gp_auxiliary_device_release() calls kfree() to free memory. Do not
> > call kfree() again in the error handling path.
> > 
> > Fix this by skipping the redundant kfree().
> > 
> > Found by code review.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 393fc2f5948f ("misc: microchip: pci1xxxx: load auxiliary bus driver for the PIO function in the multi-function endpoint of pci1xxxx device.")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> > ---
> >   drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> > index 32af2b14ff34..fbd712938bdc 100644
> > --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> > +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c
> > @@ -111,6 +111,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
> >   
> >   err_aux_dev_add_1:
> >   	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[1]->aux_dev);
> > +	goto err_aux_dev_add_0;
> >   
> >   err_aux_dev_init_1:
> >   	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[1]->aux_dev.id);
> > @@ -120,6 +121,7 @@ static int gp_aux_bus_probe(struct pci_dev *pdev, const struct pci_device_id *id
> >   
> >   err_aux_dev_add_0:
> >   	auxiliary_device_uninit(&aux_bus->aux_device_wrapper[0]->aux_dev);
> > +	goto err_ret;
> >   
> >   err_aux_dev_init_0:
> >   	ida_free(&gp_client_ida, aux_bus->aux_device_wrapper[0]->aux_dev.id);
> 
> Hi,
> 
> This is strange because the nearly same patch is in -next since June 
> 2024 ([1])
> 
> It is also in Linux since at least 6.10 ([2])
> 
> In [1] and [2], there is also a new err_ret label, which is not part of 
> your patch.
> 
> On which tree are you working?
> Is your patch compile tested?
> 
> CJ

Thank you for your response. I discovered the aforementioned bug in 
Linux kernel v6.4.16 (the latest v6.4). It appears that the fix was 
not completed in the latest version of v6.4. I have also checked the 
link you mentioned and saw that the issue has been fixed in v6.10. I 
realize that I omitted the final jump patch in the patch v1 submitted,
and I will perfect it in patch v2. Thank you for your suggestion.
--
Regards,

Ma Ke


