Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE3A62CCB5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 18:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfE1Qz2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 12:55:28 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41458 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfE1Qz2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 12:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=tjE6QMRxQGDaZAHg1T23ciZZhTNDkmGgz6H779ZcJj8=; b=uPXQ6C/Z7993dM+bButrtfQdW
        8Yln2G+Hg1mDs/MP4OEcgTyTERox9fGsdImW2ryW7QGdH9t0wJ8Ew9Gtcv4+oAcJCeHXwoALa0Ox6
        L19LQsPvtF5lwfAJSCh+vDLkHoIfn0TOuTqg4edBnawl7Xnbzv/8pNu9L7+4RIbLCtfmxMYhCKRES
        JWbznK/xcegihw3I8j3w6jhktGNRPSr3dxGejIJmSzzaPE0t+BsSoOlxN2n71FOnOEdniemwa0JA+
        M/XuaxSK+H9TjjJjwbPa/AkTzADkCij8QZeCPjlXREcX/rqO5S61NjS8GJVE9dzZRp/wwTDhP30L1
        XJH3yLozA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVfNl-0003Y9-2a; Tue, 28 May 2019 16:55:25 +0000
Subject: Re: [GIT PULL] pin control fixes for v5.2
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
References: <CACRpkdYFqcu=gz57H-+h5C3g_rvD-+XoRTw_A86PKDVA3=rfJg@mail.gmail.com>
 <CAHk-=wgZBfGwnyRGjziYvPMssSf7XO+7L_FTGfkR9Gz031VAzw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <26d4f415-4a99-05d4-3653-083991e49d97@infradead.org>
Date:   Tue, 28 May 2019 09:55:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgZBfGwnyRGjziYvPMssSf7XO+7L_FTGfkR9Gz031VAzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/28/19 9:44 AM, Linus Torvalds wrote:
> On Tue, May 28, 2019 at 1:44 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> The outstanding commits are the Intel fixes [..]
> 
> Heh. Swedism? "Outstanding" in English means "exceptionally good". I
> suspect you meant commits that "står ut", which translates to "stands
> out".
> 
> Or maybe the commits really are _that_ good?

third definition:
continuing in existence; remaining unsettled, unpaid, etc.:

i.e., missing.


-- 
~Randy
