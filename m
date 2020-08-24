Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8341B24FD8E
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Aug 2020 14:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgHXMQE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 08:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgHXMQE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2020 08:16:04 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D42DC061573
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2020 05:16:04 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id si26so11584183ejb.12
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2020 05:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=TIdKHXQfy6SgGn+KEE33EdzympBssmxR9jtnRnXHy74=;
        b=tzr8yzqRDVNtGah/CrNBv2yD4mG5qvAcpVUen0VbGcIgU98M9YccPsXnzgOh3QKeqZ
         37ulbEx56JP6vUaR63VZ6Of2pRPk4qZ/PqIVYqNieDq6puWb2LmRUXy8oWd4ISyBK+i/
         F30AEnh//IEWTCDrosGz0uYtcPV35kxPO2N1p5ZbPwwXBCb401qz7iEW3I1Tr0Qr2zrR
         8GqPjcp15LiCmSJbsq6pXFoFIIyUTemgop3SOBggqHHl04XqI9thze2ICDNfLJz1bWUc
         lKv60O0YtrP4iALThl49o4hJalMCQuce5HynTiKJEKm33q/N4qEbyILwTuVu+2OQEJaD
         npVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=TIdKHXQfy6SgGn+KEE33EdzympBssmxR9jtnRnXHy74=;
        b=aONsmDpIB7sk4SZnAWw7u5v15XTYvzWlGLf+wRJZr1KItcVwwtNZZOyDnNfZAcevU1
         +9rN+uDf6X2qsHrUNKVutyEAIar/o3g2lU2FhIGFmdqBbSHve8k+0u2vYqub6JLT+YC8
         PniZqPCBMT98cnaZ2CNOIkbofMAfRQb307SAZNUnuBuXgSln3sVvgp8NPg9/YfMcDuf8
         ZdcTki8a9n1fmWpqFEpDGayMnthy94ag9vxjBTrU2HaxYREzLNmmZjnPtRPzQI32HG9f
         Yn6Z0O24PtgYlw7jnAPCsLYhOROuV8j1BG0rXISP428QyuB5PNHyEv56qEaFQYnRM2uD
         HNuw==
X-Gm-Message-State: AOAM531pw94hOl5L1eafcE4cI/eXuUJw3RCt1ALVPf2fjUEhXqQWNaS9
        CftOCsPdcLsDgfpWrsmbie7qqPBzkg4GH+jjuasJ1cMA
X-Google-Smtp-Source: ABdhPJzlsfZs1iF3q+Si5/CZKYaTfT7WjY8UtiJiqlESpsQRrjJ7uVLuJgw6o8dsBRZ7ajRmwNuO6pmg40A8Nc7Iivs=
X-Received: by 2002:a17:906:19d5:: with SMTP id h21mr5181735ejd.505.1598271362738;
 Mon, 24 Aug 2020 05:16:02 -0700 (PDT)
MIME-Version: 1.0
From:   Belisko Marek <marek.belisko@gmail.com>
Date:   Mon, 24 Aug 2020 14:15:52 +0200
Message-ID: <CAAfyv34GFWhbjwg-jtnYr5XpjfXJnguDZFDd5_jc4cJboUMUEQ@mail.gmail.com>
Subject: looking for recent headers in different path in configure
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I'm using libgopid in yocto build system. I'm using kernel 5.6 and
would like to compile 1.5.1 libgpiod release. I have an issue that
configure phase fails that kernel headers <= 5.5. it's due totthe fact
that libc in yocto is compiled with 4.19 but I would like to use
headers from my kernel 5.6. Is there some easy way to tell configure
phase to search headers in some other directory?

Thanks and regards,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
