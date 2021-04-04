Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE63353877
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Apr 2021 16:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhDDOaN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Apr 2021 10:30:13 -0400
Received: from wilbur.contactoffice.com ([212.3.242.68]:50854 "EHLO
        wilbur.contactoffice.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhDDOaM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Apr 2021 10:30:12 -0400
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
        by wilbur.contactoffice.com (Postfix) with ESMTP id 94D20B60;
        Sun,  4 Apr 2021 16:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617546606;
        s=20210208-e7xh; d=mailfence.com; i=sandberg@mailfence.com;
        h=Date:From:Reply-To:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        l=1086; bh=ZoFEOZS4ua88slGWGzCVeW7CdwMKYX/Fd7alLNOCWtE=;
        b=NLHTrJ5ZZGLIaobdmwaEHIvxK+UkG+I9VyhvAgcikH5RYCTRZHt2YRCE9NNo/TCO
        XN/UR8HNHalfdUEokdMO673kwz0qA4WNK9vOlmKNu13UrFqkattMNsGKFWgOcXZIAg0
        jTl5uf1iTK6ZQZ8IB+RpIbfo1MnJdmPfTLqHU3gCMZGzTAXXvOahjYVLMDEzhVJbb2d
        BCh7/MGXp31bEKOeyRK52ZYmD2VnFFoY8NgyV6b1CthYLVKaPPR5nlFELoN0StBPKg6
        ECGTsFkSNx+K7Z0R2eHRqwxUk99zDMh98CqrSOWQ8DRs7nJQZB6vXBMwfKY6BQINEgE
        Z7fUIvT01A==
Date:   Sun, 4 Apr 2021 16:30:04 +0200 (CEST)
From:   Mauri Sandberg <sandberg@mailfence.com>
Reply-To: Mauri Sandberg <sandberg@mailfence.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-ID: <1306564766.662706.1617546604089@ichabod.co-bxl>
In-Reply-To: <CAPgEAj5CZ1KxLEn3=GjKJTBFM8dTpC=NRGwLkN6wuw7VVv6YDw@mail.gmail.com>
References: <20210223195326.1355245-1-sandberg@mailfence.com> <20210223195326.1355245-2-sandberg@mailfence.com> <CAPgEAj5CZ1KxLEn3=GjKJTBFM8dTpC=NRGwLkN6wuw7VVv6YDw@mail.gmail.com>
Subject: Re: [PATCH] gpio: driver for the NXP 74HC153 chip
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-Mailer: ContactOffice Mail
X-ContactOffice-Account: com:250217426
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> ----------------------------------------
> From: Drew Fustini <drew@beagleboard.org>
> On Tue, Feb 23, 2021 at 11:56 AM Mauri Sandberg <sandberg@mailfence.com> wrote:
> >
> > Support for NXP 74HC153 Dual 4-input Multiplexer. This provides a GPIO
> > interface supporting input mode only
> 
> I would like to try this out.   This seems like a commodity part so I
> looked for it in a DIP package.  I only see that from TI in the
> SN74HC153N.  Do you anticipate a different vendor being a problem?

Oh I am so sorry you guys had to see this. This is based on something I found and assumed to be up to
standards and thought of trying to upstream it with modifications to device tree functionality only. Soon
afterwards I realised its shortcomings in the GPIO api department and being too specific and sent a proposal
what's now known as 'gpio-mux-input'. No further efforts should be put into this.

I do not know how to withdraw a patch. Also, maybe I should have used the same thread with v2 instead
of sending a new patch with new title.

Apologies once again,
Mauri
