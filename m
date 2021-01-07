Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD032EC9D8
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 06:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAGFI1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 00:08:27 -0500
Received: from smtp.rcn.com ([69.168.97.78]:24217 "EHLO smtp.rcn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbhAGFI1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 00:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha1; d=rcn.com; s=20180516; c=relaxed/simple;
        q=dns/txt; i=@rcn.com; t=1609996065;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=uoq1oCgLlTqpdDX/iUbLy7J1Wic=;
        b=UcQvV0965mxj0efyblQeNeb2WfZR82H3tRivUEZjGYerMBDU9G+hJtky+zkJQuSj
        pDNucr43TglksTBZaG7s2JNWYruSa+1SwO4AxZ3yP+JYfnqHEwJnjBYSEbQJ+amQ
        TIc6BtEFxHi1A/Fvx7S9RvcmL5elMGXbje8enEaBY8JH5gfPVwpUPhhCcbXU/CVF
        SAui5RpxFaf48UIOyTddbg4/5IVYpSNkCzjtrlROrSMcIu0DArIQQqTQIrZrGr0l
        Gmbvq8bTbiW+YhrOvakGxE5eb2h+TmEdU9/vozsxfouvhNX2i4tc6RBdS4Dgm5nW
        BfDZVW41o2B8Ex5EjgvlPQ==;
X_CMAE_Category: , ,
X-CNFS-Analysis: v=2.3 cv=GfZpYjfL c=1 sm=1 tr=0 cx=a_idp_x a=ZgAMPEYdigWbDqFZ0VE/Og==:117 a=KGjhK52YXX0A:10 a=FKkrIqjQGGEA:10 a=KhXGlIqhLTsA:10 a=CpoUBDz4p5YA:10 a=IkcTkHD0fZMA:10 a=EmqxpYm9HcoA:10 a=7vim3Ctl-eEA:10 a=-CkdwNIXEh4A:10 a=x7bEGLp0ZPQA:10 a=tclcd6dtLQvEqt9_mmAA:9 a=QEXdDO2ut3YA:10 a=t2LKgQWfshoUVI3U909m:22
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
X-Authed-Username: cmpzNDk1QHJjbi5jb20=
Authentication-Results: smtp01.rcn.cmh.synacor.com smtp.mail=rjs495@rcn.com; spf=softfail; sender-id=softfail
Authentication-Results: smtp01.rcn.cmh.synacor.com header.from=rjs495@rcn.com; sender-id=softfail
Received: from [10.33.66.4] ([10.33.66.4:49522] helo=md03.rcn.cmh.synacor.com)
        by smtp.rcn.com (envelope-from <rjs495@rcn.com>)
        (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTP
        id 6C/B4-50009-02796FF5; Thu, 07 Jan 2021 00:07:45 -0500
Date:   Thu, 7 Jan 2021 00:07:44 -0500 (EST)
From:   Rita Prasad <rjs495@rcn.com>
Reply-To: Rita Prasad <rtpsad@gmail.com>
To:     Rita Prasad <rtpsad@gmail.com>
Message-ID: <295527366.33957517.1609996064638.JavaMail.root@rcn.com>
In-Reply-To: <CAMrDH7yFyw8gv-5QYoxXcGGB=-Y_934r3Uuzetk4aDg5C=cC+A@mail.gmail.com>
Subject: Re: hi
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [89.187.175.234]
X-Mailer: Zimbra 7.2.7_GA_2942 (zclient/7.2.7_GA_2942)
X-Vade-Verditct: clean
X-Vade-Analysis: gggruggvucftvghtrhhoucdtuddrgedujedrvdegtddgudegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfujgfpteevqfftnfgvrghrnhhinhhgpdftvefppdfqfgfvnecuuegrihhlohhuthemuceftddunecugfhmphhthicusghougihucdlhedtmdenucfjughrpeffhfhrvffkjgfugggtgfhiofesthejtgdtredtjeenucfhrhhomheptfhithgrucfrrhgrshgrugcuoehrjhhsgeelheesrhgtnhdrtghomheqnecuggftrfgrthhtvghrnhepfffghffgtdevtdetheefvdevgeefvdejffdvjeeuuedvudfhfefgtdegueekledunecukfhppedutddrfeefrdeiiedrgedpkeelrddukeejrddujeehrddvfeegnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehinhgvthepuddtrdeffedrieeirdegnedpmhgrihhlfhhrohhmpehrjhhsgeelheesrhgtnhdrtghomhenpdhrtghpthhtoheplhhkrhhuihgrsehrvgguihhffhhmrghilhdrtghomhen
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

