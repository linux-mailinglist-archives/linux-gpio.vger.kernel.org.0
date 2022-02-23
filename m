Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7844C15CA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 15:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbiBWOwL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 09:52:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbiBWOwK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 09:52:10 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35CD45AC5
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 06:51:41 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id x5so44484638edd.11
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 06:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=cc9MqNMmRPnGn2jNc7Pps65gjZID7Zsj838zurhiU3RpQ1hviS1Qors8acteYzwE5/
         sVQwm1RhW2p+0lMpwc5138aCJ/arkBRgNuZBItqX1cnCV/GFT/FbQ5RTe3eLuCJ5azwJ
         gl3USkY/oQB+r24UyVHZ8stpxvVQ1hBfcAdZQPnIHanPjKglDWzr4Y1vv7oe1rPGCHhy
         +P4ZoUECS72mNSazRKgGfLzksQPQ3hianGB5AXc4ezEtcBjS/cN5rkCLFMZ+puHBaSSc
         QDPhuheObzxnfuXhgvo8vp+5oZkoU6x8Baa6GCVNkJm1Ufnro5ut3sibAj1A/EMo29tK
         19Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=D0ggis6KKG8r2N+lw/mnMB3cFR7NhFsS4FdQucfE5xa+DkXTz54SbMqMuu3gNFtLBE
         22sHkNi+SvDgsey5fc8QPPee4I9JGOsuH7YkfGhqD1svZHn0R1pHzJD9BOwyVlZvFx9m
         aFntzSYAoMFwGqPR5cYc/fRlOW6QoQphM/8tE/oCllRgUNQwufnXhXoUQRsv8th5zxI+
         QlnMTC3+cUpxMhnQwS6FxhlBgG9n+lrnFS0GTBpebKq1er3e80QCLR2/W7zfFbjHviZx
         fXV2PFlDis1KjlSx5fMGSqA+YS+dIiAaAB3jvHQYeLv0AaPAckD6qa7b67Xb3xg1OUid
         Cwuw==
X-Gm-Message-State: AOAM5338BzzgrxwUbbdrLNoXaGqInV66trnu4Nc09c1jIzy2P0YTVDVO
        LlbDqE+2DLP7nF16xUIFHrLc2SfAqcQqN9w4Rxc=
X-Google-Smtp-Source: ABdhPJy9kNKhy0W1vTVANhBanBxz+2ZuiOK/eQxSbnYvSVYEvhXrniitLscasACW5Y3sEwASSotEBIFuXLTDoStFezc=
X-Received: by 2002:a50:c30a:0:b0:413:2ddb:b75 with SMTP id
 a10-20020a50c30a000000b004132ddb0b75mr4709337edb.19.1645627900098; Wed, 23
 Feb 2022 06:51:40 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6402:440d:0:0:0:0 with HTTP; Wed, 23 Feb 2022 06:51:39
 -0800 (PST)
Reply-To: avamedicinemed3@gmail.com
From:   Dr Ava Smith <tracywilliamusa@gmail.com>
Date:   Wed, 23 Feb 2022 06:51:39 -0800
Message-ID: <CAKU4NYmg4qt-Uk4ovetvcH3FDAYsfw2wiY-r5h_kjke_yz-Vdg@mail.gmail.com>
Subject: From Dr Ava Smith from United States
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
