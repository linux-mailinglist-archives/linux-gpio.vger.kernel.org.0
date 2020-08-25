Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACCB9250CB5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 02:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgHYACf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 20:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYACf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2020 20:02:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEDBC061574
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2020 17:02:35 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id nv17so281831pjb.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2020 17:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VM7bSUG3EPiv+mELUjO6epowPybFfSsSz3aa3IfL6ao=;
        b=ZHywraRe/dp61w6rDDoBpdYpAxVUDUY8AcNXJ4qqrt2R+AukCPbyQfOMA5XhEUcaqp
         td0Zg2nSyWsNIUF5zSlleNhEJuAyyfofKhRNye7aR0/RAEdweqHGN7unS+yCV4Di+z3j
         78XVuBmhgzLgT+rLKtOpohKXKB09wKOE01nq0ywiCgxgsoHlYoseh5sFV5pt2GdiTehA
         G0gJMjfnD3BUAsNN55dmZOS7lfIW/b8moF+78fzrq/7cG2qoO2ySerRstAW33j2l2SR5
         tW2zn1O9UhreQvxhSzm71Zv9W+CJQJuC5Q47dKrnitSlFVMKZF8+NDU5itq69GfWdvz9
         TJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VM7bSUG3EPiv+mELUjO6epowPybFfSsSz3aa3IfL6ao=;
        b=SXivXq2Q2Z7svXVVT+GaFvY74iBRQRUWuZ1eYZc6D8H++yYpW0IjGrs0NtscKU9T0u
         FUypNhg/3HRE8fOb7dn6V4YlXydWT78e1u/cfxSu3oFQHuaqns3O98OoCOLPNDgBtWI2
         5ppr/6DHumQ8PnEJYq10yAllXH0a1x+/CNQQKLVEvkKPcxRHU6wM7kUsdQIIK/ApsJ98
         s8G4V1prsq1SQcHXhZ605PppzkeNUwIZYKf4bBy4YXSVb5dzFAOufZMFC/svekNuM6Vn
         r+6/TQpmWlitLcuzKv68zGHY89CiVPpq6ttDnJ1PKwqV4oag43Etm7Ky1w+NQsvNFADO
         S+Ew==
X-Gm-Message-State: AOAM532pmSc0PUk0RsDFTgnpfXUUEwvnFpNxXQrtZ2Vg7QUXoLIgC4Rn
        w8FWQYJnajKAn04XJw06sR0L6wjcsVA=
X-Google-Smtp-Source: ABdhPJyUXGauHlUZWLwznr0NFLZ0Y6am3I1vDNlT91mwrTxVPS7iemtjsb9ABCKbL27HNZwRAqkhOA==
X-Received: by 2002:a17:90a:1697:: with SMTP id o23mr1324948pja.95.1598313754726;
        Mon, 24 Aug 2020 17:02:34 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id v4sm601358pjh.38.2020.08.24.17.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 17:02:33 -0700 (PDT)
Date:   Tue, 25 Aug 2020 08:02:30 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Belisko Marek <marek.belisko@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: looking for recent headers in different path in configure
Message-ID: <20200825000230.GA30038@sol>
References: <CAAfyv34GFWhbjwg-jtnYr5XpjfXJnguDZFDd5_jc4cJboUMUEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAfyv34GFWhbjwg-jtnYr5XpjfXJnguDZFDd5_jc4cJboUMUEQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 24, 2020 at 02:15:52PM +0200, Belisko Marek wrote:
> Hi,
> 
> I'm using libgopid in yocto build system. I'm using kernel 5.6 and
> would like to compile 1.5.1 libgpiod release. I have an issue that
> configure phase fails that kernel headers <= 5.5. it's due totthe fact
> that libc in yocto is compiled with 4.19 but I would like to use
> headers from my kernel 5.6. Is there some easy way to tell configure
> phase to search headers in some other directory?
> 

I use:

./autogen.sh --oldincludedir=${incdir} --enable-tools --enable-tests
make

to build against my local custom linux build, where incdir points to the
include directory of that build.

Cheers,
Kent.

