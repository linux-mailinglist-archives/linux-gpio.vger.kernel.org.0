Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00130715D70
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 13:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjE3Lke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 07:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbjE3LkS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 07:40:18 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA2EEA
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:40:17 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-565eaf83853so31482197b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685446817; x=1688038817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFrFetT34al7dY2BrfnDPxUxtiofpIRGCaJ+XqhiDX4=;
        b=TpfUtTZ1W/Yt2DgAh1Qr2g1B6Gyb+eJ7Da1iS0OiAt1+hHYEe73P4TXINLT78xJt7d
         pcFlR4CTbCS6Bw0LMDF8+MJQeady3WjEtA2hqjTYrNqhXBX0blH3S42PA9GZNT8TnU5x
         5R8EXtNm/zQSQBA6Iyj+wcFCh5unwzQk6ufi2EXRjJVp9td8C2a90Bq+GLNhI5hbfw1u
         soMD0+1bYoRT3a8gg/pLswtghap9Vr/CKbYhokZi2HH8kC4vRV2x/Dp4J1gJ86JnTNCh
         hzxWn62tQqIq2oQgRwQFkjf3x9ZIz23RHplQmY8DR7kZLRP9R+Or4C+LLGpcCwxx5gQ+
         HEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446817; x=1688038817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFrFetT34al7dY2BrfnDPxUxtiofpIRGCaJ+XqhiDX4=;
        b=RdmnzTCpKdNQBQefT6iIjIYijFT+9NpPhFGpaYGMUr+m1OAO/HXtLHlQy4LhVTtAZJ
         zJPOv5YP/C2Lt2YKW801DL8EYeL0/XBdhoeH9RSMBlO3h7T7TODy1HuUI+jdtFzGSENL
         lRy+0QYt8+nThPFnML47AXfrh62wH6KSHRjgx7x/BLN0k9UxQJVJGmnBhhhEKtPegEbR
         ZJgc9/CHr+AgIJZ/9IBypYycb1QNMgTVsnTqMEbMfu3uYLyOUJullv19bWBkJdlgOni9
         9byFmKOr3bx61bxTI9A9Qa/cTbmAd8ApjBsUhghBiGYti05BIMCh+TkSgYrHlb20//5s
         zJ5Q==
X-Gm-Message-State: AC+VfDyzaf+w78l7K8sHCoNRwXJ8yC/R3BOuYz9dwfx3k4ELmBjNUAaG
        XVXfroe0M5xVr/xpNFzsNzqOIVUKihiUnUc4NKkZdQ==
X-Google-Smtp-Source: ACHHUZ5XmULc9FTyBBvgQcWLH94hoB0C9vcu8vQ76DEyhu1q8GmASIFkf5ZYFTu+hJly3PUfEtFtJQcgJHjoziMfpHs=
X-Received: by 2002:a81:4e06:0:b0:568:9e3f:4ca4 with SMTP id
 c6-20020a814e06000000b005689e3f4ca4mr1989202ywb.34.1685446816980; Tue, 30 May
 2023 04:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230529025011.2806-1-xingtong_wu@163.com> <20230529025011.2806-2-xingtong_wu@163.com>
 <ZHSZ9cK78qc5QeZD@localhost> <CACRpkdbiRsJqxVZPNLvLPK-MzEhyjSBGffuaTgP7tt40pGGoRw@mail.gmail.com>
 <ZHSunJyh2AU1eb0H@localhost>
In-Reply-To: <ZHSunJyh2AU1eb0H@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 May 2023 13:40:06 +0200
Message-ID: <CACRpkdZY_azRbk8TW8r7JG=TqGLOSHCt8gyk3p5NE57tkxANcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio-f7188x: fix base values conflicts with other
 gpio pins
To:     simon.guinot@sequanux.org
Cc:     xingtong_wu@163.com, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, henning.schild@siemens.com,
        xingtong.wu@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 29, 2023 at 3:56=E2=80=AFPM <simon.guinot@sequanux.org> wrote:

> This way the assignation would be dynamic and the pin numbers found in
> controller datasheet would be meaningful as well.

I always had in my mind that this is what you should use the
.dbg_show() callback in struct gpio_chip for.

It is for debugging, not ABI and cross-referencing datasheets is definitely
debugging, so use that and look in /proc/sys/kernel/debug/gpio
for the data you want for cross-referencing.

Yours,
Linus Walleij
