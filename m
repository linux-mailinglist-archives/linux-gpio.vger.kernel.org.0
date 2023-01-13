Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE2E66950B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 12:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241394AbjAMLLg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 06:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241167AbjAMLKo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 06:10:44 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF6577D23
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 03:02:32 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id w14so13345323edi.5
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 03:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sRtNStpydLHV5Nt1jK6RZ1BTkNH49s1fiWpqAsDikD0=;
        b=Lwhfxk83FupElGEHn2q2PKLaIGvTrp6J11H4xDi+9znDnJ93wUw3H8CLPxb2KYNBHw
         Z96rxehLJUtAffbsjfk9B9lsTGGpdQ05t1Qx2QmpBT5AplZdhnvQDDwYv8jCGYuFdgEs
         w6DhN/lK2it9g5I5RJe4ikFaROKFq7A7oZB4oK2FrBC70MJIaIA55BqkKrtHhpPZmsn0
         Da6vHOlxDW4WzfzdQ4KRS1OsZ1uda9KWe37JiMwnu809WX1rgPYm77IkXOwoy8FreshS
         oUvJckCevTwWhr28ULzAQGNix7egDkzfrpaGpGkkErGtxJYgnQT+RABHMRFN6YY4T5sI
         WTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRtNStpydLHV5Nt1jK6RZ1BTkNH49s1fiWpqAsDikD0=;
        b=arNvooiV67cornCiw4NWwXDTvTOeJuAGNKE/VJJ3g2tym/jporx7QrMKsAlzY0f5jk
         oBcwp6jXmknFjkITBARXMupFs2xuw7FaQIjL87Bp7moEMTMKcEQhtAiHV7RaVqhF+DB+
         LKIUHH5Ggjsmax04ffbxLIzBq5snu3Fyk60I2SsgLq6tqqrmDmW5MOB4WzD7AjmnvLvK
         YWjCyZyFEtmDohU0xDN67ZUm0nv7iGs+CuVojpBnbX6BW3T6/RnrLyjKQWSkHIa/+dr4
         XQIE7xCkS2wcDke8tDxxVcdem4jbORZ/KKchovWYbCQz7wEkFq2Fp1YxRXMIKgh0SXZp
         rp4Q==
X-Gm-Message-State: AFqh2kowQQY4ETasTDeeGAzhrJkEhy39hFGC2dbUfhI3T3rMHzKiQXEW
        CzFiheipC6RDuFZB9w2m30iEpDBVmF2rAfmj6sE=
X-Google-Smtp-Source: AMrXdXvOyf4qTgm6nft0Jxdwxnr3qN7DHyXRButFxpTiPLLha2whkVhNHpT3AybiQ0n22lvDJ2B0QwDwjqZ/oHMOql8=
X-Received: by 2002:a05:6402:d5c:b0:499:f0f:f788 with SMTP id
 ec28-20020a0564020d5c00b004990f0ff788mr2649411edb.25.1673607751346; Fri, 13
 Jan 2023 03:02:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a50:3b04:0:b0:1f2:c5de:6467 with HTTP; Fri, 13 Jan 2023
 03:02:30 -0800 (PST)
Reply-To: abrahammorrison443@gmail.com
From:   Abraham Morrison <willybamaba3@gmail.com>
Date:   Fri, 13 Jan 2023 03:02:30 -0800
Message-ID: <CAGy0+JOAVW7i5FmTUmqOXsE6WPv4ptEmCHfK_hJ2+aOUAzkSpQ@mail.gmail.com>
Subject: Good day!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:544 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [willybamaba3[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [abrahammorrison443[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [willybamaba3[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.4 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Aufmerksamkeit bitte,

Ich bin Mr. Abraham Morrison, wie geht es Ihnen, ich hoffe, Sie sind
wohlauf und gesund? Hiermit m=C3=B6chte ich Sie dar=C3=BCber informieren, d=
ass
ich die Transaktion mit Hilfe eines neuen Partners aus Indien
erfolgreich abgeschlossen habe und nun der Fonds nach Indien auf das
Bankkonto des neuen Partners =C3=BCberwiesen wurde.

In der Zwischenzeit habe ich beschlossen, Sie aufgrund Ihrer
Bem=C3=BChungen in der Vergangenheit mit der Summe von 500.000,00 $ (nur
f=C3=BCnfhunderttausend US-Dollar) zu entsch=C3=A4digen, obwohl Sie mich au=
f der
ganzen Linie entt=C3=A4uscht haben. Aber trotzdem freue ich mich sehr =C3=
=BCber
den reibungslosen und erfolgreichen Abschluss der Transaktion und habe
mich daher entschieden, Sie mit der Summe von $500.000,00 zu
entsch=C3=A4digen, damit Sie die Freude mit mir teilen.

Ich rate Ihnen, sich an meine Sekret=C3=A4rin zu wenden, um eine
Geldautomatenkarte =C3=BCber 500.000,00 $ zu erhalten, die ich f=C3=BCr Sie
aufbewahrt habe. Kontaktieren Sie sie jetzt ohne Verz=C3=B6gerung.

Name: Linda Kofi
E-Mail: koffilinda785@gmail.com

Bitte best=C3=A4tigen Sie ihr die folgenden Informationen:

Ihr vollst=C3=A4ndiger Name:........
Deine Adresse:..........
Dein Land:..........
Ihr Alter: .........
Ihr Beruf:..........
Ihre Handynummer: ...........
Ihr Reisepass oder F=C3=BChrerschein:.........

Beachten Sie, dass, wenn Sie ihr die oben genannten Informationen
nicht vollst=C3=A4ndig gesendet haben, sie die Bankomatkarte nicht an Sie
herausgeben wird, da sie sicher sein muss, dass Sie es sind. Bitten
Sie sie, Ihnen die Gesamtsumme von ($ 500.000,00) Geldautomatenkarte
zu schicken, die ich f=C3=BCr Sie aufbewahrt habe.

Mit freundlichen Gr=C3=BC=C3=9Fen,

Herr Abraham Morrison
