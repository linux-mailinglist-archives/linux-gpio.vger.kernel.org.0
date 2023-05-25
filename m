Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDCD7106A1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 09:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239565AbjEYHqx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 03:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238579AbjEYHq3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 03:46:29 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7CBE62
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 00:46:17 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ae87bdc452so8260825ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 00:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685000777; x=1687592777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0zhDQWiK34ot5tBwq359lgKMK077kupVrQ//tKJGcGs=;
        b=L8VUrlXXazbMEEKp7BaLtOo79zy5ZVMfvbBHxSpKA5ip8JOMiaNJcyCHpMc4AZkgmE
         QN+Rj8x1klANNV9Rjg8tyj32fBEggzn8lUZ/Qgl8j/bEJYC6ppbqj91vGCpUinACGcd2
         TEeUXklqbI3nQyW7mmmE1pnEJuFspmYAWEThCcHb9oA4AFUNxq7JXom0QmERch/fmjhg
         Xl9XBsHpiCcS02zDhZXCIQJguzX/LnTxFzxHq5iYuTh4LGou+gdD4Wj71c5qDkY4g82h
         Ic9p6QD2Zn7c22/X1yEs7qs1BU+fIUFozGYNwGIVf6wHqTGV3ZUUhAX8nlSbOXnnth+n
         aZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685000777; x=1687592777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zhDQWiK34ot5tBwq359lgKMK077kupVrQ//tKJGcGs=;
        b=NPpuXlDZAFscDJf5iJLmpb/Tit+wQSY4FmceOljm0D0WswNA+PsQQg6/85F6dwuUC8
         niyTJY6dhHsxP7NgkAmD7uAZr8GsuFd/Xh9r7ZKIVpRpPrhDuk/R0uIcU92scEykaPVn
         i2aQcAuMfsQPibIFkhhvT82St/L2xuyamXaACdKgdItKx+9TLhrkty/BgCdVNt1eWSOI
         hLRR/asimjSmhNWZF7yMHPkbDbf496kne3Tb2e0vV+04Fb8/usiRccC8bybdHo2+LpnL
         itf8f1sQfwhBOEI9C3v1IaMlsVqzh+/JvhSXV6OoKR8qfrRtwSrmkwObpcX/YOMFG1DL
         ihFQ==
X-Gm-Message-State: AC+VfDwQXHhu4WrpbPSLAjrNpKKFshhvqpmVuHHONBl0RTq8KNqnUBbF
        DEyB+L5eOanDDSoPrhLM8KSre3rrdTo=
X-Google-Smtp-Source: ACHHUZ7avekj4UgOV+S2wBI5qg+WWYhnM4M3EKLxVOCpiiw3WlBbcxf6A5gMATQ0mZL1lx8jbUs/TQ==
X-Received: by 2002:a17:902:eb4c:b0:1ac:3605:97ec with SMTP id i12-20020a170902eb4c00b001ac360597ecmr710930pli.62.1685000776961;
        Thu, 25 May 2023 00:46:16 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902da8200b001ae6948b495sm747247plx.22.2023.05.25.00.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 00:46:16 -0700 (PDT)
Date:   Thu, 25 May 2023 15:46:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [BUG] gpiolib: cdev: can't read RELEASED event for last line
Message-ID: <ZG8SRE9QzBYRspCO@sol>
References: <ZG7RgGasxXz4/pwl@sol>
 <ZG8Jpjq/N97plOGe@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZG8Jpjq/N97plOGe@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 25, 2023 at 03:09:26PM +0800, Kent Gibson wrote:
> On Thu, May 25, 2023 at 11:09:52AM +0800, Kent Gibson wrote:
> > Hi Bart,
> > 
> I can also confirm that receiving the event using a blocking read() on the
> fd still works, it is a poll() on the fd followed by a read() that fails.
> 

Hmmm, so it occurred to me that gpionotify does the poll()/read(), so it
should exhibit the bug.  But no, it doesn't.

So it could be my code doing something boneheaded??
Or there is some other variable at play.
I'll try to write a test for it with libgpiod and see I can reproduce
it.  But I might put it on the back burner - this one isn't terribly
high priority.

Cheers,
Kent.

