Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6892715BCCE
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 11:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729511AbgBMK2v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 05:28:51 -0500
Received: from mail.intenta.de ([178.249.25.132]:33770 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgBMK2v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Feb 2020 05:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=L1+07W7g/Wx7CS4nppQVURbZ4/Axy/YwLceWayhemGU=;
        b=pzuSi3chweo2zE+YWeCsrmvJVonM4sZ89yvz16ih4fh96kwB1eVALN7NTvqd6D0IEFTPpQytA42xF1zpBMBecv8/nDnh2ZGx6qW0xeQ+wHGcQDKBjbWhLZ/kD9nNjsGZg3xB0rOU4FRG/VgUCvbyxvgsneU2Hw9WBdRjPCr+xBEOZ8KfVUe1QeEr1HN8a2YL7vG2guCBLY3hLcqpKNlYXKVDbppt5myi5/E1ookv4MirwrJosyE9WzT4oiFRlZGKjBOIIpq4/dzgUa1S5HC72akDpsuzDD5nh6AeckEfG97IA3wH7TzV27r/30OJKoC+M92S2WfCMCG9PVRO5lscmg==;
Date:   Thu, 13 Feb 2020 11:28:47 +0100
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartekgola@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod] consider changing the license of the C++ bindings
Message-ID: <20200213102847.GA16675@laureti-dev>
References: <20200212074243.GA17928@laureti-dev>
 <CAMRc=Mdj6whafFQ9KN+gi8HhKCSfkhGtqhO-+AM+3JEb5MCQPA@mail.gmail.com>
 <CAMRc=Mdcg2hp0VUsQHO2kW_uTiDAvDTCckad9D5Ja002wn1LAA@mail.gmail.com>
 <20200213101542.GA16222@laureti-dev>
 <CAMRc=McPTNKo+J3s3h9NAr9s1eCOsd_oUu9jRLTkfKH2gfBgXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMRc=McPTNKo+J3s3h9NAr9s1eCOsd_oUu9jRLTkfKH2gfBgXw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 13, 2020 at 11:17:08AM +0100, Bartosz Golaszewski wrote:
> Does explicit relicensing to LGPL-3 make sense to avoid any potential confusion?

I don't think so. Checking whether a GPL can be upgraded is a general
thing that I should quite simply have done. Most of the confusion I have
stems from reading the GPL language itself and trying to apply it
commercially.

Plus anyone encountering this issue now will quite likely have another
hit in their favourite search engine.

Helmut
