Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C451B6F6FCC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 May 2023 18:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjEDQUo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 4 May 2023 12:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjEDQUn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2023 12:20:43 -0400
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EB6359D
        for <linux-gpio@vger.kernel.org>; Thu,  4 May 2023 09:20:41 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 9b58a139-ea97-11ed-abf4-005056bdd08f;
        Thu, 04 May 2023 19:20:39 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Thu, 4 May 2023 19:20:38 +0300
To:     Milo Spadacini <milo.spadacini@comelit.it>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: fix debounce_period_us output of lsgpio
Message-ID: <ZFPbVuYRwkYYB17t@surfacebook>
References: <20230504092217.484339-1-milo.spadacini@comelit.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20230504092217.484339-1-milo.spadacini@comelit.it>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thu, May 04, 2023 at 11:22:17AM +0200, Milo Spadacini kirjoitti:

...

> NORME DI ACCESSO E DI COMPORTAMENTO PER ESTERNI<https://www.comelitgroup.com/it-it/norme-accesso-comportamento-esterni>
> 
> AVVISO DI CONFIDENZIALIT? E PRIVACY
> Questo messaggio ed i suoi eventuali allegati possono contenere informazioni confidenziali, di propriet?, legalmente protette. ? destinato all'utilizzo esclusivo del destinatario sopra indicato; la natura privata e la confidenzialit? non sono modificati da eventuali errori di trasmissione, pur avendo il mittente assunto tutte le misure di sicurezza idonee e preventive per evitarli. Il trattamento dei dati ivi contenuti, e quelli che verranno forniti in risposta, ? realizzato in conformit? alla normativa sulla privacy Reg 679/2016, potrete prendere visione della informativa anche visitando il sito www.comelitgroup.com ovvero sulle app Comelit. Rispondendo alla presente mail dichiarate di aver preso visione della richiamata informativa e di aver prestato il consenso al trattamento dei dati personali. Se il messaggio non ? a lei destinato, non deve utilizzarlo, diffonderlo, copiarlo con qualunque mezzo, o intraprendere azioni basandosi su di esso. Se ha ricevuto questo messaggio per errore, la preghiamo di volerlo distruggere (unitamente ad eventuali copie dello stesso e suoi allegati) e di volerci cortesemente informare del fatto scrivendo al mittente.
> CONFIDENTIALITY NOTICE AND PRIVACY
> This message and its attachments (if any) may contain confidential, proprietary or legally privileged information and it is intended only for the use of the addressee named above. No confidentiality or privilege is waived or lost by any erroneous transmission, despite having taken all the security and preventative measures to avoid it. The processing of personal data contained therein, and those that will be provided in response, is made in compliance with the privacy regulation Reg 679/2016, you can also read the information by visiting www.comelitgroup.com or on Comelit apps. Responding to this email, you declare that you have read the aforementioned information and have given consent to the processing of personal data If you are not the intended recipient of this message, you are hereby notified that you must not use, disseminate, copy it in any form or take any action in reliance on it. If you have received this message in error, please, delete it (and any copies of it and attachment) and kindly inform the sender.

With this footer we may not accept the change, sorry.
You have to remove it.

-- 
With Best Regards,
Andy Shevchenko


