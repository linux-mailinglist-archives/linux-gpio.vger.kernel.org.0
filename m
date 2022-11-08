Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4BF620B95
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 09:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233387AbiKHIz7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 03:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbiKHIz6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 03:55:58 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B48F2F646
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 00:55:57 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id f68so8424111vkc.8
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 00:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALE2uYDmUzLsmu+4QV93eY8C3u+SfgcYlWQ7s8B+dp0=;
        b=FXe5668a0UX4WcX/wqmK3fTdH0NjN9ORT0f/txHGysDtYc93b4l9sCxVd6rW6c/XmR
         /YEzXtzAhsgXC/gFrbbZfDw6jhU/LbulF1scvmbgodQ2IDyW0NKER2hjHMvLU1N6LUKt
         9VXGY12liYWnzNNqER9jmO/XRq/yMMy4bJuR7FeqqrP9vpaOjl8NDkmZF0FaR/EuMoPW
         VDzKfGBq3oPtaRxnMgBQ6RaG6iWAzYGuAF1XcWwABp9Gj9EP1TtgEYc2r2zp4nC4TRJr
         OXWjTpAiXE/qshX6uM3Ys80itPb1UDDrJU/ljxsukTkBSQiQw506sgmjq3S4hOmsW39+
         cLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALE2uYDmUzLsmu+4QV93eY8C3u+SfgcYlWQ7s8B+dp0=;
        b=dL287QDdx7D5hOzOuN/CZWvwrUKP45cHIkGj2wSbEIvE6rAARqzwZo5q60dxI9X37C
         ILNPB7VR1m49oKCg8LhhR2GOV9MGeozw+LKyHPChoXhpLstB8KZ7ICrZjIfjGumd59Ro
         1U0craJ6BlKm3M0Q5AXqwijN05GpYgJzrUYTbMU3EdIdCYojFiMt8Lr3QSv5St6teg1W
         uS2sQxqv79jbskFqVw1HLkvJ0m0oXZm2UdYy0A2/Wkuvw1nlSLn9Or1NEa1zzHEkIB42
         qPReFPRmkxOk7MqWB+DwjoeXeb0Nvy/MYyORnZ7AY1cLmi0MtFSYsCXioxaVrAxPatzo
         F5Ug==
X-Gm-Message-State: ACrzQf3fKkNRuWj7f3Bcsy/Pq190DEWE8JAVb2GS6320xeHVYWd3hQPk
        xZkPx1xV2dySEf+YBBvepdodF+wMPu++qAkTNdw=
X-Google-Smtp-Source: AMsMyM4VTQURGjSe3yRoH6jVfwlbUrBOIDoun3zPQIo1rp9PAEB5bVihF6AVd5wcwnKzT9t3qo/5VHqLTUvGXa8bmfA=
X-Received: by 2002:a1f:a217:0:b0:3b8:6042:74e6 with SMTP id
 l23-20020a1fa217000000b003b8604274e6mr9606277vke.4.1667897756580; Tue, 08 Nov
 2022 00:55:56 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:5a5a:0:b0:327:8138:2478 with HTTP; Tue, 8 Nov 2022
 00:55:56 -0800 (PST)
Reply-To: golsonfinancial@gmail.com
From:   OLSON FINANCIAL GROUP <mrjackson585@gmail.com>
Date:   Tue, 8 Nov 2022 00:55:56 -0800
Message-ID: <CAEJ-0XLzT+DGdyJbj36pXQWE2mhXUdEMn9V2GkHkW1WpXR18YQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=20
H, Guten Tag, Sie brauchen heute dringend einen Kredit, um eine
Investition zu t=C3=A4tigen? Ein neues Unternehmen gr=C3=BCnden oder Rechnu=
ngen
bezahlen? Und uns auf Wunsch in Raten zur=C3=BCckzahlen? Wir bieten Kredite
zu einem sehr niedrigen Zinssatz von 2% an.
F=C3=BCr weitere Informationen antworten Sie auf unsere E-Mail-Adresse:
golsonfinancial@gmail.com....
