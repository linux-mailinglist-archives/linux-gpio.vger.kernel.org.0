Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E4C51D760
	for <lists+linux-gpio@lfdr.de>; Fri,  6 May 2022 14:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241905AbiEFMUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 May 2022 08:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240181AbiEFMUQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 May 2022 08:20:16 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7834EF43
        for <linux-gpio@vger.kernel.org>; Fri,  6 May 2022 05:16:33 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246B6cvu018215;
        Fri, 6 May 2022 14:16:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=c1k2tXTDQy5YLpkrMhHEToE+PPkggICvXb46JIW2504=;
 b=F1CI58nr+PNZK21Zl3mIpeFqbHplttUdpoHPqMc71ZGQ+TyguctqKUM+xnc9gb6WVs2d
 vCTfiQWW5ej3quZ/+bknKMs9oZIfJFS/qBZd1oG1MCpflBN4aYVTf+0Suipcir1ivN3U
 NxNIjMmt0sFGHDkrWUe6Rwu5nzMSrZ+158+E/q2dvOS5TFmZhNjcqitLRUdNk+EbbXhw
 WaDTQtOyZIJkcQH88T25HafDpfvbECukADpNVbDdDA3G/xhEHHynni9+TYraY/F2rIPC
 ghxlfsEoVdel5d8DJGaCgg+wzZsi3gKPkrn0ssNhD8qoie3qJ4MWqlUOtq53ytTfPQCj gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthk948a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 May 2022 14:16:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AC0E10002A;
        Fri,  6 May 2022 14:16:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F16D21BF46;
        Fri,  6 May 2022 14:16:07 +0200 (CEST)
Received: from LMECWL0936 (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May 2022 14:16:06
 +0200
From:   <fabien.dessenne@foss.st.com>
To:     'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
        'Linus Walleij' <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>,
        'Stephen Rothwell' <sfr@canb.auug.org.au>
References: <20220505142837.165499-1-linus.walleij@linaro.org> <YnQSrDfdjFRnMz+k@smile.fi.intel.com>
In-Reply-To: <YnQSrDfdjFRnMz+k@smile.fi.intel.com>
Subject: RE: [PATCH] pinctrl: stm32: Fix up errorpath after merge
Date:   Fri, 6 May 2022 14:16:01 +0200
Message-ID: <028501d86143$10368060$30a38120$@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: fr
Thread-Index: AQKKLRqGvgjjLMcTaXH3N7zLUDj2lgIXLmkgq51xvBA=
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true; MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2022-05-06T12:15:59Z; MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard; MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0; MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=7c02426a-934d-4f13-be33-55ea4bb4b67e; MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
msip_label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_enabled: true
msip_label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_setdate: 2022-05-06T12:15:59Z
msip_label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_method: Standard
msip_label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_name: 23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0
msip_label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_siteid: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
msip_label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_actionid: a92d71b9-89b1-45bb-81d6-25410cda48b9
msip_label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_contentbits: 0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy & Linus,

I confirm that the merge fix is OK.

Fabien


ST Restricted

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: jeudi 5 mai 2022 20:09
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org; Stephen Rothwell <sfr@canb.auug.org.au>;
> Fabien Dessenne <fabien.dessenne@foss.st.com>
> Subject: Re: [PATCH] pinctrl: stm32: Fix up errorpath after merge
> 
> On Thu, May 05, 2022 at 04:28:37PM +0200, Linus Walleij wrote:
> > When merging the for_each_gpiochip_node() changes, I made some
> > mistakes by not disabling the clocks on the errorpath, fix it up.
> 
> At least this is what I found,
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> but I might have missed something, it would be nice if ST guys can look
into this
> as well.
> 
> > Fixes: a0912083086d ("Merge tag 'intel-gpio-v5.19-1' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel
> > into devel")
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> > Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> > Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/pinctrl/stm32/pinctrl-stm32.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c
> > b/drivers/pinctrl/stm32/pinctrl-stm32.c
> > index 0f7d608151ff..88da8ac0b252 100644
> > --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> > +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> > @@ -1614,6 +1614,10 @@ int stm32_pctl_probe(struct platform_device
> *pdev)
> >  		ret = stm32_gpiolib_register_bank(pctl, child);
> >  		if (ret) {
> >  			fwnode_handle_put(child);
> > +
> > +			for (i = 0; i < pctl->nbanks; i++)
> > +				clk_disable_unprepare(pctl->banks[i].clk);
> > +
> >  			return ret;
> >  		}
> >
> > --
> > 2.35.1
> >
> 
> --
> With Best Regards,
> Andy Shevchenko
> 

