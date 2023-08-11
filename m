Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8807784ED
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 03:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjHKBg4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 21:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjHKBgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 21:36:55 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45BD2D54
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 18:36:54 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b9c5e07c1bso13378535ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 18:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691717814; x=1692322614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7UTMfOaKFSt18HlYL1g8HpfFibxYJQzIAktauR7BXTA=;
        b=ZPXWhQ/xJrhiWiaHFts4PUhh83NGnPjnm4JAypKiEOjKG1gthhhgNri8jSINW3yOJS
         0G5oXWXnsfJ++PAWiy08NAM+OdxHzKK5BRlv+saErSNPcW3DlA2UM8YEbq17CK/0JhN5
         DoLlhqJmJnjJjINqoRb8HHv5ZRDGHG+JTeAL/sQpKdsjesRm4G6DfPcgmRkEpiT5vgz8
         WMAA7SK7AMRGBUoEC1B1EYOlbiK2Xref7kHK5/w8Zs2iL/vfE5MwfiuBQbPmk5H1QEfF
         UNJtvK88BrbK6DQQPlywySXMh6jgU5FMvF5hHrCupCnNJKj7nkn6Mo/ASaN69Y9y++EH
         618w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691717814; x=1692322614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UTMfOaKFSt18HlYL1g8HpfFibxYJQzIAktauR7BXTA=;
        b=HoZvH3HyulfvSOAMbYVRKewPzqOf/vUqF1bT7CF9rsiTPbK09j8r8lR1SKZkmpVQ4c
         MaZR++EhtKu6xKH2BJzBkRJmT5Fefi0q7SknR4rnYwR93BPDL/UWeELrPRBen9Z5WSZW
         +WND/GdinJWanbxtwJ/PoVzro5SObv98C0xGPwOwophlca54Ip4VU9TRAV1ZtkUT3PeM
         8MAjCvf4dzsEARSwXu4t4miczsEDVByhdLQN3r5jvHxONLZQo2NyBDSLeXHnNh3ZvulL
         fCuMSWT4RGF7X380fbtZylRJ/XmCrWQQH3dJeRdiWEQcuAyWZ5NoR4U6V9p0aXHoks8T
         R/nQ==
X-Gm-Message-State: AOJu0YxH4AwtEhlg9wKoTUP3I3WzgOHSTOTS0UGbm3vYG6s+rK7EdDHL
        nkMN5yQOXIQF5t/L3xGmYEU=
X-Google-Smtp-Source: AGHT+IFh4O7jz2+V/DMV++U64TeuuKik3i9lxwn3G8fT4uvvFan4Wo5CqqdGXlEIn7Dizs7cu0XQyg==
X-Received: by 2002:a17:902:e545:b0:1b8:76fc:5bf6 with SMTP id n5-20020a170902e54500b001b876fc5bf6mr534938plf.43.1691717814115;
        Thu, 10 Aug 2023 18:36:54 -0700 (PDT)
Received: from sol ([220.235.36.234])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902b68100b001b53be3d942sm2433364pls.232.2023.08.10.18.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 18:36:53 -0700 (PDT)
Date:   Fri, 11 Aug 2023 09:36:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZNWQsabr8kPCbD4X@sol>
References: <ZMRzYD6wGYywiPbd@sol>
 <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
 <ZM7xEbr0essN2qY3@sol>
 <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
 <ZM9oB0l4fvOinzLm@sol>
 <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
 <ZNQzT2MtskTTZTiI@sol>
 <CAN1+YZWz10vZ__3gThzTACbiPY=EVVJ_2qjrAzk6rgpjWwKv9g@mail.gmail.com>
 <ZNWH+L9o5gp6PWyq@sol>
 <CAN1+YZWTJ-TqjR99MBGSPPmQY1ao-TCGu-DfNTYBQvbXcmV=5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1+YZWTJ-TqjR99MBGSPPmQY1ao-TCGu-DfNTYBQvbXcmV=5A@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 11, 2023 at 02:26:55AM +0100, andy pugh wrote:
> On Fri, 11 Aug 2023 at 01:59, Kent Gibson <warthog618@gmail.com> wrote:
> 
> > So you don't need to alloc for it at all - gpiod_line_find() already did
> > that. As per that function's comment, you still need to close the chip
> > eventually to prevent memory leaks.
> 
> Close then free?
> 

gpiod_chip_close() does both the close of the file descriptor and the free
of the allocated struct.

Cheers,
Kent.

