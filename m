Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFB44EA626
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Mar 2022 05:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbiC2Dk2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Mar 2022 23:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbiC2Dk1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2022 23:40:27 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B36DFDE
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 20:38:45 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t13so12512718pgn.8
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 20:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jZEFZoCWhqXKMa22N7Cp5cahc3JI4TeDkoWAKazeAyA=;
        b=l2xQ7P1JFno+u7YyDVeuMBcR6XpOAkcFDMIDOtHooVIkBv6UZg2rY2N3DtVjh1BAMi
         dKgZwfdQxFLbT/sadOyzXS5fD7+q4Xz+gk8EI/d35hXSts7XhArIfAwhbD92mtP0KmBl
         UH6AiPGkJjuh1wHPHDSCKY1g9skQSQDchIrNIv1MULR45h3uXCQvxiCBTZ/P5x/Kqbb2
         5yY8L0uDlgPbGOl5Ym5ZePvGngJwFtMiQVva1eWWLLgEZ/gXne1wrCxbe7uo5zzIk2En
         e9cQqDtCtBdU20MC+dP2fBzBGpgjiZ+BIw0ZK7bERfPTrxgFMDBItvOVioFJzUIAEhv2
         jRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jZEFZoCWhqXKMa22N7Cp5cahc3JI4TeDkoWAKazeAyA=;
        b=bGFtAEIyZw/c828BnFwRgJtOiTGYvX8VyxjYEOBcMX4s5wIvP4YY+UAETAWYfb6PyZ
         KoP+6MDozJkkoGaZA+4MjocXsYMLlLr3EAXo+0jPLDjtXPlY77dEVfxZs6zUHt6llCOm
         xyBy4QFASLpvo7Stq3ZQqx4ird+r2+o/h24ntoi+Bpq+FKT9EPKb4BT3E+vW16jFIvPh
         9QAo6AUTNt2X4P5cOso5JKxmc/J/9LRc4YRIR1F7Z18dF87Xx2NhqEKXBx02/0riMSdW
         GuYu3oCJHgh/gjB4Ent7xAYFtoUAyBiysj4lSq2kR5OOQs6cE/JfpK4/PycmW40hPEDx
         nFeQ==
X-Gm-Message-State: AOAM531iml3x2p5/zWUJR6GoYteSMw+mS7+WJ9WJUgYHTt9RtYc5nqWR
        VTayTpNBuT51g8PvsM38XMI=
X-Google-Smtp-Source: ABdhPJxv90IKOq6vr+4xByDvDODIkrZkJWC+neNJ9axmxXqPDgUS+G3H6D+K72vA/UAjRXLqTm8aVA==
X-Received: by 2002:a05:6a00:729:b0:4f7:77ed:c256 with SMTP id 9-20020a056a00072900b004f777edc256mr25997030pfm.1.1648525124806;
        Mon, 28 Mar 2022 20:38:44 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id v3-20020a056a00148300b004fb04acde5dsm14194126pfu.166.2022.03.28.20.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 20:38:43 -0700 (PDT)
Date:   Tue, 29 Mar 2022 11:38:40 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: Edit/gpiomon: Question about mode
Message-ID: <20220329033840.GA14149@sol>
References: <d7f8e55e-1db8-a471-9414-5aac831432a8@gmail.com>
 <c02dbd80-5971-7319-17ad-acba33c10da6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c02dbd80-5971-7319-17ad-acba33c10da6@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 28, 2022 at 07:13:13PM +0200, Hans Kurscheidt wrote:
> 
> Am 28.03.2022 um 15:16 schrieb Hans Kurscheidt:
> > Hi,
> > 
> > what would be the right mode for gpiomon call from
> > 
> > a shellscript executed as root from systemd at system start
> > 
> > waiting on a Pin w/ pullup for invoking shutdown upon rising* edge.  
> > *changed
> > 
> > 
> > Lots of interupts, Signals and other GPIO ongoing from other user APPs &
> > threads in multi-user state.
> 
> 2b more precise: I wired a GPIO Pin to GND.
> 
> Upon the cmd: sudo gpiomon -r -n1 <chip> <offset>
> 
> the program exits immediately with 1 event, although there was never a
> rising edge due to the fix wire to GND. Is this a feature or a bug, and is
> it reproducible?
> 

Not a feature and not reproducible for me on a Raspberry Pi4 with the
setup you describe, so probably a bug specific to your hardware platform,
whatever that may be.

If it is 100% reproduceable for you, and assuming it is an initialisation
issue so you only get the one spurious event, how about using -n2 as a
workaround ;-)?

Cheers,
Kent.
